import Vue from 'vue';
import entry from './app';
import VueRouter from 'vue-router';
import Vui from 'vui-pc';
import hljs from 'highlight.js';
import routes from './route.config';
import demoBlock from './components/demo-block';
import MainHeader from './components/header';
import SideNav from './components/side-nav';
import title from './i18n/title';

import 'vui-pc/lib/theme-chalk/index.css';
import './demo-styles/index.scss';
import './assets/styles/common.css';
import './assets/styles/fonts/style.css';

Vue.use(Vui);
Vue.use(VueRouter);
Vue.component('demo-block', demoBlock);
Vue.component('main-header', MainHeader);
Vue.component('side-nav', SideNav);

const router = new VueRouter({
  mode: 'history',
  base: __dirname,
  // base: '/',
  routes
});

router.afterEach(route => {
  // https://github.com/highlightjs/highlight.js/issues/909#issuecomment-131686186
  Vue.nextTick(() => {
    const blocks = document.querySelectorAll('pre code:not(.hljs)');
    Array.prototype.forEach.call(blocks, hljs.highlightBlock);
  });
  const data = title[route.meta.lang];
  for (let val in data) {
    if (new RegExp('^' + val, 'g').test(route.name)) {
      document.title = data[val];
      return;
    }
  }
  document.title = 'Connor';
});

new Vue({ // eslint-disable-line
  ...entry,
  router
}).$mount('#app');
