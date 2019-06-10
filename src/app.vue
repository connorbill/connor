<template>
  <div id="app">
    <!--:class="{ 'is-component': isComponent }"-->
    <main-header v-if="lang !== 'play'"></main-header>
    <div class="main-cnt">
      <router-view :key="$route.fullPath"></router-view>
    </div>

    <div class="drawer-wrapper">
      <div class="drawer drawer-left " :class="{'drawer-open': isShowMenu}">
        <div class="drawer-mask" @click="showHandle">
        </div>
        <div class="drawer-content-wrapper move-menu-hide">
          <div class="drawer-content" ref="drawerContent">
            <vui-scrollbar class="page-component__nav" ref="pageComponentNav">
              <side-nav :data="navsData[langMenu]" :base="`/${ langMenu }`"></side-nav>
            </vui-scrollbar>
          </div>
          <div class="drawer-handle" @click="showHandle">
            <i class="drawer-handle-icon"></i>
          </div>
        </div>
      </div>
    </div>
    <vui-scrollbar class="page-component__scroll" ref="componentScrollBar">
      <div>
        <div class="page-container page-component" :class="{'theme-config': isThemeConfigVisible}">

          <transition name="back-top-fade">
            <div
              class="page-component-up"
              :class="{ 'hover': hover }"
              v-show="showBackToTop"
              @mouseenter="hover = true"
              @mouseleave="hover = false"
              @click="toTop">
              <i class="vui-icon-caret-top"></i>
            </div>
          </transition>
        </div>
      </div>
    </vui-scrollbar>
  </div>
</template>

<script>
  import {use} from 'vui-pc/lib/locale';
  import zhLocale from 'vui-pc/lib/locale/lang/zh-CN';
  import enLocale from 'vui-pc/lib/locale/lang/en';
  import bus from './bus';
  import navsData from './nav.config.json';
  import throttle from 'throttle-debounce/throttle';

  const lang = location.hash.replace('#', '').split('/')[1] || 'zh-CN';
  const localize = lang => {
    switch (lang) {
      case 'zh-CN':
        use(zhLocale);
        break;
      default:
        use(enLocale);
    }
  };
  localize(lang);

  export default {
    name: 'app',

    data() {
      return {
        langMenu: this.$route.meta.lang,
        navsData,
        hover: false,
        showBackToTop: false,
        scrollTop: 0,
        showHeader: true,
        componentScrollBar: null,
        componentScrollBoxElement: null,
        isThemeConfigVisible: false,
        isShowMenu: false
      };
    },
    computed: {
      lang() {
        return this.$route.path.split('/')[1] || 'zh-CN';
      },
      isComponent() {
        return /^component-/.test(this.$route.name || '');
      }
    },

    watch: {
      lang(val) {
        // if (val === 'zh-CN') {
        //   this.suggestJump();
        // }
        localize(val);
      },
      '$route.path'() {
        // 触发伪滚动条更新
        this.componentScrollBox.scrollTop = 0;
        this.$nextTick(() => {
          this.componentScrollBar.update();
        });
      }
    },

    methods: {
      showHandle() {
        this.isShowMenu = !this.isShowMenu;
        if (this.isShowMenu) {
          // open-menu
          document.body.classList.add('open-menu');
          let pageComponentNav = this.$refs.drawerContent.offsetWidth;
          document.querySelector('body').style.transform = 'translateX(' + pageComponentNav + 'px)';
        } else {
          document.querySelector('body').style.transform = 'translateX(0)';
          document.body.classList.remove('open-menu');
        }
      },
      renderAnchorHref() {
        if (/changelog/g.test(location.href)) return;
        const anchors = document.querySelectorAll('h2 a,h3 a,h4 a,h5 a');
        const basePath = location.href.split('#').splice(0, 2).join('#');

        [].slice.call(anchors).forEach(a => {
          const href = a.getAttribute('href');
          a.href = basePath + href;
        });
      },

      goAnchor() {
        if (location.href.match(/#/g).length > 1) {
          const anchor = location.href.match(/#[^#]+$/g);
          if (!anchor) return;
          const elm = document.querySelector(anchor[0]);
          if (!elm) return;

          setTimeout(_ => {
            this.componentScrollBox.scrollTop = elm.offsetTop;
          }, 50);
        }
      },
      toTop() {
        this.hover = false;
        this.showBackToTop = false;
        this.componentScrollBox.scrollTop = 0;
      },

      handleScroll() {
        const scrollTop = this.componentScrollBox.scrollTop;
        this.showBackToTop = scrollTop >= 0.5 * document.body.clientHeight;
        if (this.showHeader !== this.scrollTop > scrollTop) {
          this.showHeader = this.scrollTop > scrollTop;
        }
        if (scrollTop === 0) {
          this.showHeader = true;
        }
        if (!this.navFaded) {
          bus.$emit('fadeNav');
        }
        this.scrollTop = scrollTop;
      }
      // suggestJump() {
      //   if (process.env.NODE_ENV !== 'production') return;
      //
      //   const href = location.href;
      //   const preferGithub = localStorage.getItem('PREFER_GITHUB');
      //   if (href.indexOf('element-cn') > -1 || href.indexOf('element.faas') > -1 || preferGithub) return;
      //   setTimeout(() => {
      //     if (this.lang !== 'zh-CN') return;
      //     this.$confirm('建议大陆用户访问部署在国内的站点，是否跳转？', '提示')
      //       .then(() => {
      //         location.href = location.href
      //           .replace('https:', 'http:')
      //           .replace('element.', 'element-cn.');
      //       })
      //       .catch(() => {
      //         localStorage.setItem('PREFER_GITHUB', 'true');
      //       });
      //   }, 1000);
      // }

    },

    created() {
      bus.$on('navFade', val => {
        this.navFaded = val;
      });
      bus.$on('user-theme-config-visible', val => {
        this.isThemeConfigVisible = val;
      });
    },
    mounted() {
      localize(this.lang);
      if (this.lang === 'zh-CN') {
        // this.suggestJump();
      }
      if (window.userThemeConfigVisible) {
        this.isThemeConfigVisible = window.userThemeConfigVisible;
      }
      this.componentScrollBar = this.$refs.componentScrollBar;
      this.componentScrollBox = this.componentScrollBar.$el.querySelector('.vui-scrollbar__wrap');
      this.throttledScrollHandler = throttle(300, this.handleScroll);
      this.componentScrollBox.addEventListener('scroll', this.throttledScrollHandler);
      this.renderAnchorHref();
      // this.goAnchor();
      document.body.classList.add('is-component');
    },
    destroyed() {
      document.body.classList.remove('is-component');
    },
    beforeDestroy() {
      this.componentScrollBox.removeEventListener('scroll', this.throttledScrollHandler);
    },
    beforeRouteUpdate(to, from, next) {
      next();
      setTimeout(() => {
        if (location.href.match(/#/g).length < 2) {
          document.documentElement.scrollTop = document.body.scrollTop = 0;
          this.renderAnchorHref();
        } else {
          // this.goAnchor();
        }
      }, 100);
    }
  };
</script>
<style lang="scss">
  .page-component__scroll {
    height: calc(100% - 80px);
    margin-top: 80px;

    .vui-scrollbar__wrap {
      overflow-x: auto;
    }
  }

  .page-component {
    box-sizing: border-box;
    height: 100%;

    &.page-container {
      padding: 0;
    }

    .page-component__nav {
      width: 240px;
      position: fixed;
      top: 0;
      bottom: 0;
      margin-top: 80px;
      transition: padding-top .3s;

      .vui-scrollbar__wrap {
        height: 100%;
      }

      &.is-extended {
        padding-top: 0;
      }
    }

    .side-nav {
      height: 100%;
      padding-top: 50px;
      padding-bottom: 50px;
      padding-right: 0;

      & > ul {
        padding-bottom: 50px;
      }
    }

    .page-component__content {
      padding-left: 270px;
      padding-bottom: 100px;
      box-sizing: border-box;
    }

    .content {
      padding-top: 50px;

      > {
        h3 {
          margin: 55px 0 20px;
        }

        table {
          border-collapse: collapse;
          width: 100%;
          background-color: #fff;
          font-size: 14px;
          margin-bottom: 45px;
          line-height: 1.5em;

          strong {
            font-weight: normal;
          }

          td, th {
            border-bottom: 1px solid #dcdfe6;
            padding: 15px;
            max-width: 250px;
          }

          th {
            text-align: left;
            white-space: nowrap;
            color: #909399;
            font-weight: normal;
          }

          td {
            color: #606266;
          }

          th:first-child, td:first-child {
            padding-left: 10px;
          }
        }

        ul:not(.timeline) {
          margin: 10px 0;
          padding: 0 0 0 20px;
          font-size: 14px;
          color: #5e6d82;
          line-height: 2em;
        }
      }
    }

    .page-component-up {
      background-color: #fff;
      position: fixed;
      right: 100px;
      bottom: 150px;
      width: 40px;
      height: 40px;
      size: 40px;
      border-radius: 20px;
      cursor: pointer;
      transition: .3s;
      box-shadow: 0 0 6px rgba(0, 0, 0, .12);
      z-index: 5;

      i {
        color: #409EFF;
        display: block;
        line-height: 40px;
        text-align: center;
        font-size: 18px;
      }

      &.hover {
        opacity: 1;
      }
    }
    .back-top-fade-enter,
    .back-top-fade-leave-active {
      transform: translateY(-30px);
      opacity: 0;
    }
  }

  @media (min-width: 1140px) {
    /*.page-component__content {*/
    /*transition: padding-right 0.3s ease;*/
    /*&.theme-config {*/
    /*padding-right: 26%;*/
    /*}*/
    /*}*/
    /*.page-container.page-component {*/
    /*transition: all 0.3s ease;*/
    /*&.theme-config {*/
    /*width: 98%;*/
    /*.page-component__nav {*/
    /*animation-delay: 1s;*/
    /*padding-left: 2%;*/
    /*}*/
    /*}*/
    /*}*/
  }

  @media (min-width: 1600px) {
    .page-component__content {
      &.theme-config {
        padding-right: 25%;
      }
    }
    .page-container.page-component {
      &.theme-config {
        width: 1600px;
      }
    }
  }

  body {
    -webkit-transition: opacity 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), box-shaow 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), -webkit-transform 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
    transition: opacity 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), box-shaow 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), -webkit-transform 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
    transition: transform 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), opacity 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), box-shaow 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
    transition: transform 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), opacity 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), box-shaow 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86),
    -webkit-transform 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
  }

  .page-component {
    /*.page-component__nav {*/
    /*width: 260px;*/
    /*position: static;*/
    /*margin-top: 40;*/
    /*}*/
    .side-nav {
      padding-top: 0;
      padding-left: 50px;
    }
    .page-component__content {
      padding-left: 10px;
      padding-right: 10px;
      padding-top: 50px;
    }
    .content {
      padding-top: 0;
    }
    .content > table {
      overflow: auto;
      display: block;
    }
    .page-component-up {
      display: none;
    }

  }

  body {

    .drawer {
      position: fixed;
      top: 0;
      z-index: 9999;
    }
    .drawer > * {
      -webkit-transition: opacity 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), box-shaow 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), -webkit-transform 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
      transition: opacity 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), box-shaow 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), -webkit-transform 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
      transition: transform 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), opacity 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), box-shaow 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
      transition: transform 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), opacity 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), box-shaow 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), -webkit-transform 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
    }
    .drawer .drawer-mask {
      background: #000;
      opacity: 0;
      width: 0;
      height: 0;
      position: fixed;
      top: 0;
      -webkit-transition: opacity 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), width 0s ease 0.3s, height 0s ease 0.3s;
      transition: opacity 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), width 0s ease 0.3s, height 0s ease 0.3s;
    }
    .drawer-content-wrapper {
      position: fixed;
      background: #fff;
      left: 0;
    }
    .drawer-content {
      overflow: auto;
      z-index: 1;
      position: relative;
    }
    .drawer-handle {
      position: absolute;
      top: 20px;
      width: 41px;
      height: 40px;
      cursor: pointer;
      z-index: 0;
      text-align: center;
      line-height: 40px;
      font-size: 16px;
      display: -ms-flexbox;
      display: -webkit-box;
      display: -webkit-flex;
      display: flex;
      -ms-flex-pack: center;
      -webkit-box-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -ms-flex-align: center;
      -webkit-box-align: center;
      -webkit-align-items: center;
      align-items: center;
      background: #fff;
    }
    .drawer-handle-icon {
      width: 14px;
      height: 2px;
      background: #333;
      position: relative;
      -webkit-transition: background 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
      transition: background 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
    }
    .drawer-handle-icon:before,
    .drawer-handle-icon:after {
      content: '';
      display: block;
      position: absolute;
      background: #333;
      width: 100%;
      height: 2px;
      -webkit-transition: -webkit-transform 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
      transition: -webkit-transform 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
      transition: transform 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
      transition: transform 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86), -webkit-transform 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
    }
    .drawer-handle-icon:before {
      top: -5px;
    }
    .drawer-handle-icon:after {
      top: 5px;
    }
    .drawer-left,
    .drawer-right {
      width: 0%;
      height: 100%;
    }
    .drawer-left .drawer-content-wrapper,
    .drawer-right .drawer-content-wrapper,
    .drawer-left .drawer-content,
    .drawer-right .drawer-content {
      height: 100%;
      width: 200px;
    }
    .drawer-left.drawer-open,
    .drawer-right.drawer-open {
      width: 100%;
    }
    .drawer-left .drawer-handle {
      right: -40px;
      -webkit-box-shadow: 2px 0 8px rgba(0, 0, 0, 0.15);
      box-shadow: 2px 0 8px rgba(0, 0, 0, 0.15);
      border-radius: 0 4px 4px 0;
    }
    .drawer-left.drawer-open .drawer-content-wrapper {
      -webkit-box-shadow: 2px 0 8px rgba(0, 0, 0, 0.15);
      box-shadow: 2px 0 8px rgba(0, 0, 0, 0.15);
    }
    .drawer-right .drawer-content-wrapper {
      right: 0;
    }
    .drawer-right .drawer-handle {
      left: -40px;
      -webkit-box-shadow: -2px 0 8px rgba(0, 0, 0, 0.15);
      box-shadow: -2px 0 8px rgba(0, 0, 0, 0.15);
      border-radius: 4px 0 0 4px;
    }
    .drawer-right.drawer-open .drawer-content-wrapper {
      -webkit-box-shadow: -2px 0 8px rgba(0, 0, 0, 0.15);
      box-shadow: -2px 0 8px rgba(0, 0, 0, 0.15);
    }
    .drawer-top,
    .drawer-bottom {
      width: 100%;
      height: 0%;
    }
    .drawer-top .drawer-content-wrapper,
    .drawer-bottom .drawer-content-wrapper,
    .drawer-top .drawer-content,
    .drawer-bottom .drawer-content {
      width: 100%;
    }
    .drawer-top .drawer-handle,
    .drawer-bottom .drawer-handle {
      left: 50%;
      margin-left: -20px;
    }
    .drawer-top.drawer-open,
    .drawer-bottom.drawer-open {
      height: 100%;
    }
    .drawer-top .drawer-handle {
      top: auto;
      bottom: -40px;
      -webkit-box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
      border-radius: 0 0 4px 4px;
    }
    .drawer-top.drawer-open .drawer-wrapper {
      -webkit-box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
    }
    .drawer-bottom .drawer-content-wrapper {
      bottom: 0;
    }
    .drawer-bottom .drawer-handle {
      top: -40px;
      -webkit-box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.15);
      box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.15);
      border-radius: 4px 4px 0 0;
    }
    .drawer-bottom.drawer-open .drawer-content-wrapper {
      -webkit-box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.15);
      box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.15);
    }
    .drawer.drawer-open .drawer-mask {
      opacity: .3;
      width: 100%;
      height: 100%;
      -webkit-animation: rcDrawerFadeIn 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
      animation: rcDrawerFadeIn 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
      -webkit-transition: none;
      transition: none;
    }
    .drawer.drawer-open .drawer-handle-icon {
      background: transparent;
    }
    .drawer.drawer-open .drawer-handle-icon:before {
      -webkit-transform: translateY(5px) rotate(45deg);
      -ms-transform: translateY(5px) rotate(45deg);
      transform: translateY(5px) rotate(45deg);
    }
    .drawer.drawer-open .drawer-handle-icon:after {
      -webkit-transform: translateY(-5px) rotate(-45deg);
      -ms-transform: translateY(-5px) rotate(-45deg);
      transform: translateY(-5px) rotate(-45deg);
    }
    @-webkit-keyframes rcDrawerFadeIn {
      0% {
        opacity: 0;
      }
      100% {
        opacity: 0.3;
      }
    }
    @keyframes rcDrawerFadeIn {
      0% {
        opacity: 0;
      }
      100% {
        opacity: 0.3;
      }
    }
    .move-menu {
      transition: transform 0.3s cubic-bezier(0.78, 0.14, 0.15, 0.86) 0s;
      transform: translateX(27px);
    }
    .move-menu-hide {
      transform: translateX(-100%);
    }
  }

  .open-menu .page-container {
    /*width: 100%;*/
  }
</style>
