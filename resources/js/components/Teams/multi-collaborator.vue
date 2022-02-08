<template>
  <div>
    <div class="control-section">
      <div id="content" style="width: 450px">
        <ejs-multiselect
          id="multi-template"
          :dataSource="data"
          :fields="fields"
          cssClass="multiselect-template"
          :placeholder="watermark"
          :itemTemplate="iTemplate"
          popupHeight="250px"
        ></ejs-multiselect>
      </div>
    </div>
  </div>
</template>
<style>
.multiselect-template .header {
  font-weight: 600;
  color: rgba(0, 0, 0, 0.54);
  height: 48px;
  padding: 15px 0 0 16px;
  font-size: 16px;
  background-color: #f5f5f5;
  font-family: "Segoe UI", "GeezaPro", "DejaVu Serif";
}

.fabric .multiselect-template .header {
  background-color: #fff;
  border-bottom: 1px solid #ccc;
  color: #0078d7;
  font-weight: 400;
}

.bootstrap .multiselect-template .header {
  background-color: #fff;
  border-bottom: 1px solid #ccc;
  color: #777;
  font-family: "Helvetica Neue", "Helvetica", "Arial", "sans-serif";
  font-weight: 400;
  font-size: 12px;
  line-height: 30px;
  height: 30px;
  padding: 0 0 0 24px;
}

.highcontrast .multiselect-template .header {
  color: #fff;
  background-color: #000;
}

.e-bigger.bootstrap .multiselect-template .header {
  line-height: 44px;
  height: 44px;
  font-size: 13px;
}

.bootstrap .multiselect-template .info,
.e-bigger.bootstrap .multiselect-template .info {
  margin-left: 25px;
}

.bootstrap .multiselect-template .job {
  opacity: 0.54;
  font-size: 14px;
  margin-top: -25px;
  margin-bottom: 20px;
}

.e-bigger.bootstrap .multiselect-template .job {
  font-size: 15px;
  margin-top: -32px;
  margin-bottom: 17px;
}

.tailwind .multiselect-template .job {
  margin-top: -7px;
  margin-bottom: 5px;
}

.e-bigger.tailwind .multiselect-template .job {
  margin-top: -15px;
  margin-bottom: 5px;
}

.bootstrap .multiselect-template .ename {
  font-size: 15px;
  margin-top: 20px;
  opacity: 0.87;
  padding: 3px 0 20px;
}

.e-bigger.bootstrap .multiselect-template .ename {
  font-size: 16px;
  padding-bottom: 15px;
}

.bootstrap .multiselect-template .empImage,
.e-bigger.bootstrap .multiselect-template .empImage {
  margin: 0px 10px 0 20px;
}

.multiselect-template .info {
  margin-left: 17px;
}

.multiselect-template .ename {
  display: block !important;
  opacity: 0.87;
  font-size: 16px;
  margin-top: 8px;
}

.multiselect-template .job {
  opacity: 0.54;
  font-size: 14px;
  margin-top: -15px;
  margin-bottom: 7px;
}

.multiselect-template .empImage {
  margin: 6px 16px;
  float: left;
  width: 50px;
  height: 50px;
}

.multiselect-template .e-list-item * {
  display: block;
  text-indent: 0;
}

.e-bigger:not(.bootstrap) .multiselect-template .e-dropdownbase .e-list-item {
  line-height: 42px;
  height: 80px;
}

.e-bigger:not(.bootstrap) .multiselect-template.e-popup .empImage {
  margin: 10px 16px;
}
.bootstrap4 .multiselect-template .header {
  color: #6c757d;
}

.bootstrap4 .multiselect-template.e-popup .empImage {
  margin: 1px 16px;
}

.bootstrap4 .multiselect-template.e-popup .job {
  margin-top: 0;
}

.bootstrap4 .multiselect-template.e-popup .job {
  margin-top: -15px;
}
</style>
<script>
import Vue from "vue";
import { MultiSelectPlugin } from "@syncfusion/ej2-vue-dropdowns";
import * as data from "./dataSource.json";

Vue.use(MultiSelectPlugin);

var headerVue = Vue.component("headerTemplate", {
  template:
    '<div class="header"> <span>Photo</span> <span class="info">Employee Info</span></div>',
  data() {
    return {
      data: {},
    };
  },
});

var itemVue = Vue.component("itemTemplate", {
  template:
    '<div style="display:flex;"><div class="ename" style="width:35%;"> {{data.Name}} </div><div class="job" style="padding-top:25px;"> {{data.Designation}} </div></div>',
  data() {
    return {
      data: {},
    };
  },
});

export default Vue.extend({
  data: function () {
    return {
      fields: { value: "Name" },
      watermark: "Select Collaborator",
      hTemplate: function (e) {
        return {
          template: headerVue,
        };
      },
      iTemplate: function (e) {
        return {
          template: itemVue,
        };
      },
      data: data["empList"],
    };
  },
});
</script>