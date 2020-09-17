/* eslint-disable no-console */
/* eslint-disable import/no-dynamic-require */
/* eslint-disable global-require */
const axios = require('axios');

(async () => {
  try {
    const res = await axios({
      url: 'https://npm.taobao.org/sync/uniswap-blocklet?sync_upstream=true',
      method: 'put',
      timeout: 5000,
    });
    console.log('trigger cnpm sync success', 'uniswap-blocklet', res.data);
  } catch (err) {
    console.error('trigger cnpm sync failed', 'uniswap-blocklet');
  }
})();

(async () => {
  try {
    const res = await axios.post('https://api.netlify.com/build_hooks/5d71fd6472feae0bb5d28671');
    console.log('trigger blocklets build success:', res.status);
  } catch (error) {
    console.error('trigger blocklets build failed:', error);
  }
})();
