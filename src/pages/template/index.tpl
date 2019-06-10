<style scoped lang="scss">

  .banner {
    text-align: center;
  }

  .banner-desc {
    padding-top: 20px;

    h1 {
      margin: 0;
      line-height: 48px;
      color: #555;
    }

    p {
      line-height: 28px;
      color: #888;
      margin: 10px 0 5px;
    }
  }

  .sponsors {
    display: flex;
    justify-content: center;
  }

  .sponsor {
    margin: 0 20px 50px;
    display: inline-flex;
    width: 300px;
    height: 100px;
    justify-content: center;

    img {
      margin-right: 20px;
    }

    div {
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    p {
      margin: 0;
      line-height: 1.8;
      color: #999;
      font-size: 14px;
    }
  }


  .cards {
    margin: 0 auto 110px;
    width: 1140px;

    .container {
      padding: 0;
      margin: 0 -11px;
      width: auto;
      &::before, &::after {
        display: table;
        content: "";
      }
      &::after {
        clear: both;
      }
    }

    li {
      width: 33.33333%;
      padding: 0 19px;
      box-sizing: border-box;
      float: left;
      list-style: none;
    }

    img {
      width: 160px;
      height: 120px;
    }
  }

  .card {
    height: 430px;
    width: 100%;
    background: #ffffff;
    border: 1px solid #eaeefb;
    border-radius: 5px;
    box-sizing: border-box;
    text-align: center;
    position: relative;
    transition: all .3s ease-in-out;
    bottom: 0;

    img {
      margin: 66px auto 60px;
    }
    h3 {
      margin: 0;
      font-size: 18px;
      color: #1f2f3d;
      font-weight: normal;
    }
    p {
      font-size: 14px;
      color: #99a9bf;
      padding: 0 25px;
      line-height: 20px;
    }
    a {
      height: 53px;
      line-height: 52px;
      font-size: 14px;
      color: #409EFF;
      text-align: center;
      border: 0;
      border-top: 1px solid #eaeefb;
      padding: 0;
      cursor: pointer;
      width: 100%;
      position: absolute;
      bottom: 0;
      left: 0;
      background-color: #fff;
      border-radius: 0 0 5px 5px;
      transition: all .3s;
      text-decoration: none;
      display: block;

      &:hover {
        color: #fff;
        background: #409EFF;
      }
    }
    &:hover {
      bottom: 6px;
      box-shadow: 0 6px 18px 0 rgba(232, 237, 250, 0.50);
    }
  }

  @media (max-width: 1140px) {
    .cards {
      width: 100%;
      .container {
        width: 100%;
        margin: 0;
      }
    }
    .banner .container {
      width: 100%;
      box-sizing: border-box;
    }
    .banner img {
      right: 0;
    }
  }

  @media (max-width: 1000px) {
    .banner .container {
      img {
        display: none;
      }
    }
    .jumbotron {
      display: none;
    }
  }

  @media (max-width: 768px) {
    .cards {
      li {
        width: 80%;
        margin: 0 auto 20px;
        float: none;
      }
      .card {
        height: auto;
        padding-bottom: 54px;
      }
    }
    .banner-stars {
      display: none;
    }
    .banner-desc {
      #line2 {
        display: none;
      }
      h2 {
        font-size: 32px;
      }
      p {
        width: auto;
      }
    }
  }

  .content--canvas {

    .demo-2 {
      --color-text: #ff53ff;
      --color-link: #3c48fa;
      --color-link-hover: #fff;
      --color-title: #fff;
    }

    /* Fade effect */
    .js body {
      opacity: 0;
      transition: opacity 0.3s;
    }

    .js body.render {
      opacity: 1;
    }

    /* Page Loader */
    .js .loading::before {
      content: '';
      position: fixed;
      z-index: 100000;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: var(--color-bg);
    }

    .js .loading::after {
      content: '';
      position: fixed;
      z-index: 100000;
      top: 50%;
      left: 50%;
      width: 60px;
      height: 60px;
      margin: -30px 0 0 -30px;
      pointer-events: none;
      border-radius: 50%;
      opacity: 0.4;
      background: var(--color-link);
      animation: loaderAnim 0.7s linear infinite alternate forwards;
    }

    @keyframes loaderAnim {
      to {
        opacity: 1;
        transform: scale3d(0.5, 0.5, 1);
      }
    }

    a {
      text-decoration: none;
      color: var(--color-link);
      outline: none;
    }

    a:hover,
    a:focus {
      color: var(--color-link-hover);
      outline: none;
    }

    .frame {
      padding: 3rem 5vw;
      text-align: center;
      position: relative;
      z-index: 1000;
    }

    .frame__title {
      font-size: 1rem;
      margin: 0 0 1rem;
      font-weight: normal;
    }

    .frame__links {
      display: inline;
    }

    .frame__github,
    .frame__links a:not(:last-child),
    .frame__demos a:not(:last-child) {
      margin-right: 1rem;
    }

    .frame__demos {
      margin: 1rem 0;
    }

    .frame__demo--current,
    .frame__demo--current:hover {
      text-decoration: underline;
      color: var(--color-link);
    }

    .content {
      display: flex;
      flex-direction: column;
      width: 100vw;
      height: calc(100vh - 13rem);
      position: relative;
      justify-content: flex-start;
      align-items: center;
    }

    .content__title {
      position: absolute;
      top: 50%;
      left: 0;
      width: 100%;
      text-align: center;
      margin: -5.5vw 0 0 0;
      z-index: 100;
      font-size: 10vw;
      color: var(--color-title);
      line-height: 1;
    }
    background: hsla(260, 40%, 5%, 1);
    .vui-pc-box {
      position: absolute;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
      width: 100%;
      height: 200px;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }
    .vui-pc-addr {
      display: inline-block;
      height: 40px;
      padding: 0 24px;
      font-size: 16px;
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'PingFang SC', 'Hiragino Sans GB', 'Microsoft YaHei', 'Helvetica Neue', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol';
      line-height: 38px;
      text-align: center;
      text-decoration: none;
      border: 1px solid #2f54eb;
      border-radius: 100px;
      color: #fff;
      background: #2f54eb;
      text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
      -webkit-box-shadow: 0 2px 0 rgba(0, 0, 0, 0.045);
      box-shadow: 0 2px 0 rgba(0, 0, 0, 0.045);
      outline: 0;
      font-weight: 400;
      white-space: nowrap;
    }
    .hello {
      margin: 8px 0 28px;
      font-size: 34px;
      line-height: 48px;
      color: #555;
      font-family: Avenir, -apple-system, BlinkMacSystemFont, 'Segoe UI', 'PingFang SC', 'Hiragino Sans GB', 'Microsoft YaHei', 'Helvetica Neue', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', sans-serif;

    }
  }
  @media screen and (min-width: 53em) {
    .message {
      display: none;
    }
    .frame {
      position: fixed;
      text-align: left;
      z-index: 10000;
      top: 0;
      left: 0;
      display: grid;
      align-content: space-between;
      width: 100%;
      max-width: none;
      height: 100vh;
      padding: 2rem 2.25rem;
      pointer-events: none;
      grid-template-columns: 25% 50% 25%;
      grid-template-rows: auto auto auto;
      grid-template-areas: 'title title ... ' '... ... ...' 'github demos links';
    }
    .frame__title-wrap {
      grid-area: title;
      display: flex;
    }
    .frame__title {
      margin: 0;
    }
    .frame__github {
      grid-area: github;
      justify-self: start;
      margin: 0;
    }
    .frame__demos {
      margin: 0;
      grid-area: demos;
      justify-self: center;
    }
    .frame__links {
      grid-area: links;
      padding: 0;
      justify-self: end;
    }
    .frame a {
      pointer-events: auto;
    }
  }
  .content--canvas {
    height: 100%;
    justify-content: center;
  }
  /*#app .main-cnt{*/
    /*height: calc(100% - 80px);*/
  /*}*/
</style>
<template>
  <div style="height: 100%">
    <main style="height: 100%">
      <div  class="content content--canvas">
        <!-- <h2 class="content__title">Swirl</h2> -->
        <div class="content__title">
          <div class="hello" style="color: #1989fa;">欢迎来到 <span>connor.red</span></div>
          <a class="vui-pc-addr" href="http://connor.red/vui/">
            进入vui-pc文档地址
          </a>
        </div>
      </div>
    </main>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        lang: this.$route.meta.lang
      };
    }
  };
</script>
