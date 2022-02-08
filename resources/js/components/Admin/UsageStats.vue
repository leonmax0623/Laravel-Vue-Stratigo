<template>
  <v-app class="main-frame">
    <Layout />
    <SideBar />
    <div
      class="main-contents"
      style="width: calc(100vw - 427px); left: 415px; margin-top: 10px"
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="15px"
        height="20px"
        viewBox="0 0 19.296 19.296"
        style="margin-bottom: 7px; margin-left: 28px"
      >
        <path
          d="M71.562,109.858a.8.8,0,0,0,1.118-.209l3.04-4.442,3.217,3.1a.8.8,0,0,0,.638.221.817.817,0,0,0,.583-.339l5.336-7.651.193,2.56a.8.8,0,1,0,1.6-.122l-.339-4.5a.8.8,0,0,0-.862-.74l-4.5.339a.8.8,0,0,0,.122,1.6l2.56-.193-4.891,7.01-3.225-3.111a.786.786,0,0,0-.638-.221.8.8,0,0,0-.583.347l-3.58,5.23A.8.8,0,0,0,71.562,109.858Z"
          transform="translate(-68.841 -94.319)"
        />
        <path
          d="M29.493,28.689H12.607V11.8A.8.8,0,0,0,11,11.8V29.493a.8.8,0,0,0,.8.8H29.493a.8.8,0,1,0,0-1.607Z"
          transform="translate(-11 -11)"
        />
      </svg>
      <span
        style="font-family: 'Montserrat'; font-size: 22px; font-weight: bolder"
        >Usage Stats</span
      >
      <v-row style="margin-top: 30px">
        <v-col class="col-6">
          <v-card
            class="overflow-hidden mx-auto pa-2"
            height="200"
            max-width="650"
          >
            <div class="row">
              <div class="col-12">
                <span class="name">Teams Summary</span>
                <span class="detail">Last 60 days</span>
              </div>
            </div>
            <div class="row">
              <div class="col-6">
                <span class="num">4</span><br />
                <span class="num_desc">Teams created</span>
              </div>
              <div class="col-6">
                <span class="num">4</span><br />
                <span class="num_desc">Teams updated</span>
              </div>
            </div>
          </v-card>
        </v-col>
        <v-col class="col-6">
          <v-card
            class="overflow-hidden mx-auto pa-2"
            height="200"
            max-width="650"
          >
            <div class="row">
              <div class="col-12">
                <span class="name">Goals Summary</span>
                <span class="detail">Last 60 days</span>
              </div>
            </div>
            <div class="row">
              <div class="col-6">
                <span class="num">4</span><br />
                <span class="num_desc">Goals created</span>
              </div>
              <div class="col-6">
                <span class="num">4</span><br />
                <span class="num_desc">Goals updated</span>
              </div>
            </div>
          </v-card>
        </v-col>
      </v-row>
      <v-row style="margin-top: 15px">
        <v-col class="col-6" style="margin-top: 6px">
          <v-card
            class="overflow-hidden mx-auto pa-2"
            height="200"
            max-width="650"
          >
            <div class="row">
              <div class="col-12">
                <span class="name">Objectives Summary</span>
                <span class="detail">Last 60 days</span>
              </div>
            </div>
            <div class="row">
              <div class="col-6">
                <span class="num">4</span><br />
                <span class="num_desc">Objectives created</span>
              </div>
              <div class="col-6">
                <span class="num">4</span><br />
                <span class="num_desc">Objectives updated</span>
              </div>
            </div>
          </v-card>
        </v-col>
        <v-col class="col-6" style="margin-top: 7px">
          <v-card
            class="overflow-hidden mx-auto pa-2"
            height="200"
            max-width="650"
          >
            <div class="row">
              <div class="col-12">
                <span class="name">Storage Used</span>
                <v-progress-linear
                  color="grey lighten-1"
                  height="10"
                  value="2"
                  striped
                  style="height: 30px; border-radius: 10px"
                ></v-progress-linear
                ><br />
                <span class="num-desc" style="padding-top: 30px"
                  >0.00 B of 2 GB</span
                >
              </div>
            </div>
          </v-card>
        </v-col>
      </v-row>
    </div>
  </v-app>
</template>

<script>
import Layout from ".././Layout.vue";
import SideBar from "./SideBar.vue";
export default {
  components: {
    Layout,
    SideBar,
  },
  data() {
    return {
      skill: 20,
      knowledge: 33,
      power: 78,
    };
  },
};
</script> 

<style scoped>
span {
  font-family: "Montserrat";
  font-size: 16px;
  font-weight: bold;
  letter-spacing: 0;
  margin-bottom: 5px;
}
.row {
  margin: 10px;
  justify-self: unset;
}
.mine {
  text-align: center !important;
}
.detail {
  font-size: 14px;
  font-weight: bolder;
  float: right;
}
.name {
  font-size: 26px;
  font-weight: bold;
  float: left;
}
.num {
  font-size: 29px;
  font-weight: bold;
  text-align: center;
}
.num_desc {
  font-size: 18px;
  font-weight: bold;
  text-align: center;
}
.col-6 {
  text-align: center;
}
</style>