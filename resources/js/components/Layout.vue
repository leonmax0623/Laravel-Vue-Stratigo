<template>
  <div class="side-panel">
    <div class="top">
      <div class="item">
        <a href="#" @click="switch1">
          <img src="../img/download.png" alt="Logo" class="brand"
        /></a>
      </div>
      <div class="item switch" style="margin-top: 40px !important">
        <router-link to="/dashboard">
          <i class="mdi mdi-account-multiple-outline"></i>
          <div>Teams</div>
        </router-link>
      </div>
      <div class="item switch" style="margin-top: 3px !important">
        <router-link to="/goals_main">
          <i class="mdi mdi-flag-checkered"></i>
          <div>Goals</div>
        </router-link>
      </div>
      <div class="item switch" style="margin-top: 3px !important">
        <router-link to="/goals_main">
          <i class="mdi mdi-checkbox-marked-circle-outline"></i>
          <div>Excute</div>
        </router-link>
      </div>
      <div class="item switch" style="margin-top: 3px !important">
        <router-link to="/goals_main">
          <i class="mdi mdi-chart-bar-stacked"></i>
          <div>Results</div>
        </router-link>
      </div>
    </div>
    <div class="bottom">
      <div class="item_b">
        <a href="javascript::void(0);"><i class="fas fa-bell"></i></a>
      </div>
      <div class="item_b">
        <a href="javascript::void(0);"><i class="fas fa-search"></i></a>
      </div>
      <div class="item_b">
        <a href="javascript::void(0);"><i class="mdi mdi-help-circle"></i></a>
      </div>
      <div class="item_b">
        <a href="/logout">
          <i class="fas fa-sign-out-alt"></i>
        </a>
      </div>
      <div class="item">
        <router-link to="/admin_users">Admin Setting</router-link>
      </div>

      <form
        id="export-csv"
        action="/unit/exportcsv/"
        method="POST"
        style="display: none"
      >
        @csrf
        <input type="hidden" name="unit_id" id="input_unit_id" />
      </form>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  },
  methods: {
    resizeMainContent() {
      setTimeout(function () {
        var tWidth = $(".main-frame").width();
        var sp = $(".side-panel").width();
        var so = $(".side-options").width();
        // this.so = -this.so;
        var mLeft = sp + so + 20;
        var mWidth = tWidth - mLeft;
        console.log(mLeft + ":" + mWidth);
        var height = $(".side-panel").height();
        $(".main-contents").css({
          width: mWidth + "px",
          left: mLeft + "px",
          height: height + "px",
        });
      }, 100);
    },
    switch1() {
      $(".side-options").toggleClass("collapse");
      this.resizeMainContent();
    },
  },
};
</script> 

<style lang="scss" scoped>
.side-panel {
  width: 90px !important;
}
</style>