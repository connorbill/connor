## Upload 上传

通过点击或者拖拽上传文件

### 点击上传

:::demo 通过 slot 你可以传入自定义的上传按钮类型和文字提示。可通过设置`limit`和`on-exceed`来限制上传文件的个数和定义超出限制时的行为。可通过设置`before-remove`来阻止文件移除操作。
```html
<vui-button @click="upFile">点击上传</vui-button>
<vui-dialog
  title="图片上传"
  :visible.sync="upload.isShow"
  width="500px"
>
  <vui-upload
    action="/fileUpload/upload2"
    :accept="upload.accept"
    :multiple="upload.multiple"
    :auto-upload="upload.autoUpload"
    :limit="upload.limit"
    :before-upload="beforeFile"
    :on-all-file="getAllFile"
    :on-remove="onRemove"
  >
  </vui-upload>
  <template v-slot:footer class="dialog-footer">
    <div class="middle-right-wrap">
      <vui-button @click="upload.isShow = false" type="primary" plain>取 消</vui-button>
      <div style="margin-right: 15px;"></div>
      <vui-button
        type="primary"
        :loading="upload.isSaving"
        @click="judgeUpload()"
        :disabled="upload.disabled"
      >确认添加</vui-button>
    </div>
  </template>
</vui-dialog>
<script>
  export default {
    data() {
      return {
        upload: {
          isShow: false,
          isSaving: false,
          autoUpload: true,
          multiple: false,
          accept: '*',
          limit: 1,
          disabled: true,
          type: 0,
          pathType: 'path',
          agenciesId: '',
          agenciesNo: '',
          index: '',
          index2: '',
          fileIndex: '',
          num: 0,
        }
      };
    },
    methods: {
      // 点击显示弹框 选择上传文件
      upFile: function(obj, num) {
        //id, type, pathType, agenciesNo
        this.upload.limit = 20;
        this.upload.multiple = true;
        // 置空
        this.upload.id = '';
        this.upload.type = '';
        this.upload.pathType = '';
        this.upload.agenciesId = '';
        this.upload.agenciesNo = '';
        this.upload.num = 0;
        this.upload.index = '';
        this.upload.index2 = '';
  
        this.upload.isShow = true;
        this.upload.disabled = true;
      },
      beforeFile: function(file, size) {
        if (size > 20 * 1024 * 1024) {
          return {
            right: false,
            tip: '上传文件不能大于20M'
          };
        }
  
        var fileValue = {
          path: '/fengkong/' + 20191234 + '/' + 20191234
        };
        let formData = new FormData();// FormData 对象
        formData.append('file', file);
        var params = {
          param: fileValue,
          contentType: 'formdata',
          data: formData
        };
        var back = {
          right: true,
          param: params,
          tip: ''
        };
  
        return back;
      },
      onRemove: function(file, list, index) {
        this.getAllFile(list);
      },
      getAllFile: function(file) {
        var that = this;
        var hasOneTrue = false;
        this.willUploadImg = [].concat(file);
        var willUploadImg = this.$refs.uploadFileRef.willUploadImg;
        willUploadImg.forEach(function(item, index) {
          // 判断是否上传失败
          if (item.res) {
            if (item.res.code != '000000') {
              Vue.set(that.$refs.uploadFileRef.willUploadImg[index], 'hasUp', false);
              Vue.set(that.$refs.uploadFileRef.willUploadImg[index], 'failure', true);
            } else if (item.res.code == '000000') {
              hasOneTrue = true;
            }
          }
        });
        if (hasOneTrue) {
          this.upload.disabled = false;
        } else {
          this.upload.disabled = true;
        }
      },
      // 判断每一个文件是否上传成功，上传成功的才执行添加文件
      judgeUpload: function() {
        var that = this;
        this.upload.isSaving = true;
        this.willUploadImg.forEach(function(item, index) {
          // 判断是否上传失败
          if (item.res.code == '000000') {
            var url = item.res.data.url;
            that.saveUpload(url, item.name);
          }
        });
      },
      // 新增签约文件
      saveUpload: function(url, fileName) {
        let that = this;
        var sendData = {
          qyId: this.detailId,
          type: this.upload.type,
          path: url
        };
        let config = {
          url: '',
          method: 'post',
          contentType: 'form',
          data: sendData
        };
        axiosRequest(config)
          .then(function(res) {
            
          })
      },
    }
  }
</script>
```
:::


### Attribute
| 参数      | 说明          | 类型      | 可选值                           | 默认值  |
|---------- |-------------- |---------- |--------------------------------  |-------- |
| action | 必选参数，上传的地址 | string | — | — |
| multiple | 是否支持多选文件 | boolean | — | — |
| accept | 接受上传的文件类型| string | — | — |
| auto-upload | 选择文件后是否自动上传 | boolean | — | — |
| multiple | 是否多选 | boolean | — | — |
| limit | 最多选择文件个数 | number | — | — |
| on-after-upload | 每上传一张图返回当前接口返回对象res:接口返回对象， index第几个文件 | function(res, index) | — | — |
| before-upload | 每一个文件上传之前file：当前文件信息所有信息， size: 文件大小 | function(file, size) | — | — |
| on-remove | 接受上传的文件类型obj:被删除对象信息，fileList: 剩下的文件数组，index：删除之前的文件在数组中的下标 | function(obj, fileList, index) | — | — |
| on-all-file | 当选择的所有图片上传完，接口都有回调时，返回文件所有信息的数组 | function(fileList) | — | — |


