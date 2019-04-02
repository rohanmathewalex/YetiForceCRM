/* {[The file is published on the basis of YetiForce Public License 3.0 that can be found in the following directory: licenses/LicenseEN.txt or yetiforce.com]} */
import { store } from '/src/store/index.js'
import mutations from '/src/store/mutations.js'
import { i18n } from '../i18n/index.js'
import { Router } from '../router/index.js'

const BaseService = axios.create({
  baseURL: '/'
})

BaseService.interceptors.response.use(
  function(response) {
    return response
  },
  function(error) {
    console.log(error)
    console.log(error.response)
    const data = error.response.data
    let type = 'error'
    if (data.error) {
      Quasar.plugins.Notify.create({
        color: 'negative',
        icon: 'mdi-exclamation',
        message: data.error.message,
        position: 'top',
        actions: [{ label: i18n.t('LBL_CLOSE'), color: 'white' }]
      })
    } else if (data.exception) {
      type = 'exception'
      Router.push('/error404')
    }
    data.type = data.type || type
    store.commit(mutations.Core.Debug.push, { source: 'BaseService', data: data })
    return Promise.reject(error)
  }
)
export default BaseService