<style scoped>
  h3 {
    margin-bottom: 15px;
  }
  .block {
    margin-bottom: 55px;
  }
  p {
    margin: 0 0 15px;
  }
  .nav-demos {
    p {
      margin-bottom: 50px;
    }
    h5 {
      margin: 0;
    }
    img {
      padding: 15px;
      background-color: #F9FAFC;
      width: 100%;
      margin-bottom: 15px;
      cursor: pointer;
    }
  }
  .dialog-img {
    position: fixed;
    overflow: auto;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1000;
    -webkit-overflow-scrolling: touch;
    outline: 0;

    .imgWrap {
      margin: 0 auto;
      position: relative;
      top: 100px;
      padding-bottom: 50px;
    }
    img {
      display: block;
      width: 100%;
    }
  }
  .mask {
    position: fixed;
    top: 0;
    right: 0;
    left: 0;
    bottom: 0;
    background-color: #373737;
    background-color: rgba(55, 55, 55, 0.6);
    height: 100%;
    z-index: 1000;
  }
  .zoom-enter-active,
  .zoom-leave-active {
    transition: transform .3s cubic-bezier(0.78, 0.14, 0.15, 0.86), opacity .3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
  }
  .zoom-enter,
  .zoom-leave-active {
    transform: scale(0.3);
    opacity: 0;
  }
  .fade-enter-active,
  .fade-leave-active {
    transition: opacity .3s cubic-bezier(0.78, 0.14, 0.15, 0.86);
  }
  .fade-enter,
  .fade-leave-active {
    opacity: 0;
  }
</style>
<template>
  <div>

  </div>
</template>
<script>
  export default {
    data() {
      return {
        imgUrl: '',
        imgBound: {},
        showDialog: false,
        imgStyle: {},
        imgWrapStyle: {}
      };
    },
    watch: {
      showDialog(val) {
        document.body.style.overflow = val ? 'hidden' : '';
      }
    },
    methods: {
      enlarge(imgWidth, ev) {
        var imgNode = ev.target;
        // var bound = imgNode.getBoundingClientRect();
        var offset = {};
        var doc = document;

        offset.left = (doc.body.scrollWidth - imgWidth) / 2;
        offset.top = 100;

        this.imgUrl = imgNode.src;
        this.imgBound = imgNode.getBoundingClientRect();

        this.imgWrapStyle.transformOrigin = `${ev.clientX}px ${ev.clientY}px`;
        // this.imgStyle.transformOrigin = `${ev.clientX}px ${ev.clientY}px`;
        this.imgStyle.width = imgWidth + 'px';
        this.showDialog = true;
      }
    }
  };
</script>
