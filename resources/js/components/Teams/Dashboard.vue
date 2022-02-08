<template>
  <div class="main-frame" id="app">
    <layout></layout>
    <div class="side-options" style="left: 90px" ref="sideapp">
      <section id="sidebar">
        <div class="secside">
          <div class="headsec">
            <h4>
              <i
                class="fa fa-users to"
                aria-hidden="true"
                style="font-size: 24px"
              >
                <span>Plan Teams</span></i
              >
            </h4>
          </div>
          <ul id="dock secside" class="sidebarli">
            <li class="launcher to">
              <a href="#" class="sidetext">
                <img src="../../img/check.png" class="unity" />
                <span> My Teams</span>
              </a>
            </li>
            <li class="launcher to">
              <a href="#" class="sidetext">
                <img src="../../img/star.png" class="unity" />
                <span> My Favorites</span>
              </a>
            </li>
            <li class="launcher to">
              <input type="text" class="searchbar" placeholder="Search" />
            </li>

            <li class="loadingeffectli">
              <img src="../../img/loading.gif" style="width: 40%" />
            </li>

            <li class="launcher to" v-for="unit in units" :key="unit.id">
              <a href="#" style="padding-left: 7px" @click="unit_id(unit.id)"
                ><img src="../../img/unity.png" style="width: 15px" />
                {{ unit.unit_name }}</a
              >
            </li>
          </ul>
          <ul style="list-style: none">
            <li class="launcher to">
              <a href="#" id="add_unit" @click="add_unit" class="sidetext">
                <i class="fa fa-plus" aria-hidden="true"></i>
                <span>Add Unit </span>
              </a>
            </li>
          </ul>
        </div>
      </section>
      <span class="arrow switch" @click="switch1"
        ><i class="fas fa-angle-left"></i
      ></span>
    </div>
    <div class="main-contents team-wrapper" style="left: 366px">
      <div class="main-heading-bar">
        <Headingbar
          v-bind:id="id"
          v-bind:unitData="unitData"
          :updateUnit="updateUnit"
          :duplicateUnit="duplicateUnit"
        ></Headingbar>
      </div>
      <div class="contents sectionsec">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
          <li class="nav-item" role="presentation">
            <a
              class="nav-link"
              id="home-tab"
              data-toggle="tab"
              href="#"
              @click="overview()"
              role="tab"
              aria-controls="home"
              aria-selected="false"
              >Overview</a
            >
          </li>
          <li class="nav-item" role="presentation">
            <a
              class="nav-link active"
              id="team-tab"
              data-toggle="tab"
              href="#"
              @click="teams()"
              role="tab"
              aria-controls="team"
              aria-selected="true"
              >Teams</a
            >
          </li>
          <li class="nav-item" role="presentation">
            <a
              class="nav-link"
              id="Teammates-tab"
              data-toggle="tab"
              href="#"
              @click="teammates()"
              role="tab"
              aria-controls="Teammates"
              aria-selected="false"
              >Teammates</a
            >
          </li>
        </ul>
      </div>
      <teams
        v-bind:class="{ 'd-show': visible == 0, 'd-none': visible != 0 }"
        :id="id"
      />
      <overview
        v-bind:class="{ 'd-show': visible == 1, 'd-none': visible != 1 }"
        :id="id"
      />
      <teammates
        v-bind:class="{ 'd-show': visible == 2, 'd-none': visible != 2 }"
        :id="id"
      />
    </div>
    <!-- --------modal------- -->
    <div
      class="modal fade"
      id="addNewUnit"
      tabindex="-1"
      role="dialog"
      aria-labelledby="addNewUnit"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5
              class="modal-title"
              style="
                display: inline-block;
                font: normal normal 600 16px/26px Montserrat;
              "
            >
              Add Unit
            </h5>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true" style="font-size: 28px">&times;</span>
            </button>
          </div>

          <form id="addunitForm" @submit.prevent="store()">
            <div class="modal-body" style="padding-top: 0">
              <div class="form-group">
                <label style="font: normal normal 490 11px Montserrat"
                  >Name of the Unit</label
                >
                <input
                  type="text"
                  id="unit_name1"
                  class="form-control"
                  style="border-radius: 2px; margin-top: 5px"
                  autocomplete="off"
                />
              </div>

              <div class="form-group">
                <label style="font: normal normal 490 11px Montserrat"
                  >Name of the team responsible for the unit with access to
                  planing execution and revision of all teams in the
                  unit:</label
                >
                <input
                  type="text"
                  id="team_name"
                  class="form-control"
                  style="border-radius: 2px; margin-top: 5px"
                  autocomplete="off"
                />
              </div>
            </div>
            <div class="modal-footer">
              <a
                href="#"
                data-dismiss="modal"
                style="
                  font: normal normal 490 11px Montserrat;
                  letter-spacing: 2px;
                  margin-right: 10px;
                  text-decoration: none;
                "
                >Cancel</a
              >
              <button
                type="submit"
                class="submit btn btn-primary"
                style="
                  font: normal normal 490 14px Montserrat;
                  padding: 8px 12px;
                  height: auto;
                "
              >
                Add Unit
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
 
<style>
.d-show {
  display: show;
}
.d-none {
  display: none;
}
label.error {
  color: red;
  font: normal normal 200 11px Montserrat;
}

input.error {
  border-color: red;
}

.modal-dialog {
  max-width: 500px;
  margin: 150px auto;
}

.fade.in {
  opacity: 1;
}

a.dropdown-item {
  padding-left: 15px;
}
</style>

<script>
import Layout from "../Layout.vue";
import Headingbar from "../Headingbar.vue";
import Overview from "./Overview.vue";
import Teams from "./Teams.vue";
import Teammates from "./Teammates.vue";

export default {
  components: {
    Layout,
    Headingbar,
    Overview,
    Teams,
    Teammates,
  },

  data() {
    return {
      visible: 0,
      unitData: {},
      id: 0,
      units: [],
      form: new Form({
        id: "",
        unit_id: "",
        name: "",
        unit_name: "",
      }),
    };
  },
  watch: {
    "$route.params": {
      handler(newValue) {
        this.get_units();
        const $this = this;
        setTimeout(function () {
          $this.resizeMainContent();
        }, 100);
      },
      immediate: true,
    },
  },
  methods: {
    // --------------headingbar-----------
    updateUnit(unitform) {
      // var this = this;
      // setTimeout(function () {
      this.$Progress.start();
      unitform.unit_id = this.id;
      console.log("update", unitform.unit_name);
      unitform
        .post("/api/unit/updateunit")
        .then((data) => {
          $("#editUnitModal").modal("hide");

          Toast.fire({
            icon: "success",
            title: data.data.message,
          });
          this.$Progress.finish();
          this.get_units();
        })
        .catch(() => {
          Toast.fire({
            icon: "error",
            title: "Some error occured! Please try again",
          });
        });
      // }, 100);
    },
    duplicateUnit(unitform) {
      this.$Progress.start();
      unitform.unit_id = this.id;
      unitform
        .post("/api/unit/duplicateunit")
        .then((data) => {
          $("#duplicateModal").modal("hide");

          Toast.fire({
            icon: "success",
            title: data.data.message,
          });
          this.$Progress.finish();
          this.get_units();
        })
        .catch(() => {
          Toast.fire({
            icon: "error",
            title: "Some error occured! Please try again",
          });
        });
    },
    // -------------------------
    overview() {
      this.visible = 1;
      console.log(this.visible);
    },
    teams() {
      this.visible = 0;
    },
    teammates() {
      this.visible = 2;
    },
    unit_id(id) {
      this.id = id;
      axios
        .get("/api/teams/list", {
          params: {
            unit_id: this.id ? this.id : 0,
          },
        })
        .then(({ data }) => {
          this.unitData = data.data.unitData;
          console.log("unitdata", this.unitData);
        });
    },
    resizeMainContent() {
      const $this = this;
      setTimeout(function () {
        var tWidth = $(".main-frame").width();
        var sp = $(".side-panel").width();
        var so = $(".side-options").width();
        // this.so = -this.so;
        var mLeft = sp + so + 20;
        var mWidth = tWidth - mLeft;
        console.log(mLeft);
        $(".main-contents").css({
          width: mWidth + "px",
          left: mLeft + "px",
        });
      }, 100);
    },
    switch1() {
      $(".side-options").toggleClass("collapse");
      this.resizeMainContent();
    },
    get_units() {
      axios
        .get("/api/unit/unit_list", {
          params: {},
        })
        .then(({ data }) => {
          this.units = data.data;
          // this.units.map((unit, key) => {
          //   console.log(unit.unit_name);
          // });
        });
    },
    store() {
      this.$Progress.start();
      this.form.name = $("#team_name").val();
      this.form.unit_name = $("#unit_name1").val();
      this.$forceUpdate();
      this.form
        .post("/api/unit/store")
        .then((data) => {
          Toast.fire({
            icon: "success",
            title: data.data.message,
          });
          this.$Progress.finish();
          window.location.reload();
        })
        .catch(() => {
          Toast.fire({
            icon: "error",
            title: "Some error occured! Please try again",
          });
        });
    },

    add_unit() {
      $("#addNewUnit").modal("show");
    },
  },
};
</script>

