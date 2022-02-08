<template>
  <div>
    <div class="tab-content" id="myTabContent">
      <div
        class="tab-pane fade show active"
        id="Teammates"
        role="tabpanel"
        aria-labelledby="Teammates-tab"
      >
        <div
          class="
            d-flex
            justify-content-between
            align-items-center
            px-lg-4
            py-lg-3
            px-3
            py-2
          "
        >
          <div>
            <button
              type="button"
              class="btn btn-primary"
              @click="newTeammateModal"
            >
              <span>+ </span>Add Teammate
            </button>
          </div>
          <div>
            <a href="#" class="mr-3"
              ><i class="mdi mdi-progress-check"></i> All Teammates</a
            >
            <a href="#" class="mr-3"
              ><i class="mdi mdi-filter-variant"></i> Filter</a
            >
            <a href="#" class="mr-3"><i class="mdi mdi-sort"></i> Sort</a>
            <a href="#" @click="customize_teammates()" class="mr-3"
              ><i class="mdi mdi-settings-outline"></i> Customize</a
            >
          </div>
        </div>
        <div
          class="table-responsive"
          style="display: flex; align-items: flex-start"
        >
          <table class="table table-hover">
            <thead>
              <tr>
                <th class="border-right" width="45%">Teammate name</th>
                <th class="border-right">Teams</th>
                <th class="border-right">Job Title</th>
                <th class="border-right">
                  <i class="fa fa-plus"></i>
                </th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="teammate in teammates.data" v-bind:key="teammate.id">
                <td
                  class="border-right h5 font-weight-bold teamtdtitle"
                  @click="toggleCteammates(teammate.id)"
                >
                  <span class="badge badge-primary badge-pill">{{
                    teammate.user.name | short_hand
                  }}</span>
                  <a href="#">{{ teammate && teammate.user.name }}</a>
                </td>
                <td class="">
                  <span class="mr-3">
                    <a href=""
                      ><i
                        class="fa fa-users to"
                        aria-hidden="true"
                        id="navbarSideButton"
                      ></i
                    ></a>
                    {{ teammate.team ? teammate.team.name : "" }}
                  </span>
                </td>
                <td></td>
                <td></td>
              </tr>
            </tbody>
          </table>
          <div
            style="
              border-top: 1px solid #cdcdcd;
              border-left: 1px solid #cdcdcd;
              padding: 15px;
            "
            v-bind:class="{ 'd-table': !flag, 'd-none': flag }"
          >
            <h4 style="margin-bottom: 30px">Customize</h4>
            <div style="display: flex">
              <h2 style="font-size: 15px; width: 50%">Fields</h2>
              <a
                href="#"
                style="width: 50%; text-align: right"
                @click="add_field()"
                >+Add field</a
              >
            </div>

            <div class="wrap button">
              <div style="width: 70%">
                <img style="width: 10px" src="../../img/custom.png" />
                Planners
              </div>

              <label class="switch">
                <input type="checkbox" />
                <span class="slider round"></span>
              </label>
            </div>
            <div class="wrap button">
              <div style="width: 70%">
                <img style="width: 10px" src="../../img/custom.png" />
                Collaborator
              </div>

              <label class="switch">
                <input type="checkbox" />
                <span class="slider round"></span>
              </label>
            </div>
            <div class="wrap button">
              <div style="width: 70%">
                <img style="width: 10px" src="../../img/custom.png" />
                Tohire
              </div>

              <label class="switch">
                <input type="checkbox" />
                <span class="slider round"></span>
              </label>
            </div>
            <div class="wrap button">
              <div style="width: 70%">
                <img style="width: 10px" src="../../img/custom.png" />
                Assignee
              </div>

              <label class="switch">
                <input type="checkbox" />
                <span class="slider round"></span>
              </label>
            </div>
          </div>
        </div>
        <div
          class="card-footer"
          style="
            background-color: rgb(255 255 255);
            border-top: 1px solid rgb(255 255 255);
          "
        >
          <pagination
            :data="teammates"
            @pagination-change-page="getResults"
          ></pagination>
        </div>
        <div
          class="side-options-overlay overlay collapse"
          v-for="(teammate, i) in teammates.data"
          :id="'teammateprofilelist_' + teammate.id"
          :key="i"
        >
          <div class="card card-outline-secondary h-100 border-0">
            <form
              autocomplete="off"
              id="myForm"
              class="form"
              role="form"
              @submit.prevent="submitTeamEdit()"
            >
              <input type="hidden" id="teammate_id" :value="teammate.id" />
              <div class="card-header d-flex justify-content-between">
                <div>
                  <span class="badge badge-primary badge-pill">{{
                    teammate.user.name | short_hand
                  }}</span>
                  <h4 class="d-inline-block">
                    {{ teammate && teammate.user.name }}
                  </h4>
                </div>
                <div>
                  <!--a href="#" class="h4 ml-3"><i class="mdi mdi-more text-primary" aria-hidden="true"></i></a-->
                  <div
                    class="dropdown-menu dropdownMenuButton"
                    aria-labelledby="dropdownMenuButton"
                  >
                    <a class="dropdown-item" href="#" @click="editUnitModal"
                      ><i
                        class="fas fa-pencil-alt"
                        style="margin-right: 5px"
                      ></i>

                      <div
                        type="submit"
                        style="font-family: 'Spartan', sans-serif"
                      >
                        <img src="../../img/edit.png" style="width: 15%" /></div
                    ></a>
                  </div>

                  <a
                    href="#"
                    class="h4 ml-3 overlay-close"
                    @click="toggleCteammates(teammate.id)"
                    ><i
                      class="mdi mdi-arrow-collapse-right text-primary"
                      aria-hidden="true"
                    ></i
                  ></a>
                </div>
              </div>
              <div class="card-body" style="overflow-y: scroll">
                <div class="form-group row">
                  <label
                    class="col-lg-3 col-form-label form-control-label"
                    style="text-align: center"
                    >Email</label
                  >
                  <div class="col-lg-8">
                    <input
                      type="text"
                      name="Email"
                      class="form-control"
                      style="border-radius: 2px; margin-top: 5px"
                      autocomplete="off"
                      placeholder="valdes15@gmail.com"
                    />
                  </div>
                </div>
                <div class="form-group row">
                  <label
                    class="col-lg-3 col-form-label form-control-label"
                    style="text-align: center"
                    >Job title</label
                  >
                  <div class="col-lg-8">
                    <input
                      type="text"
                      name="Email"
                      class="form-control"
                      style="border-radius: 2px; margin-top: 5px"
                      autocomplete="off"
                      value="General manager"
                    />
                  </div>
                </div>
                <div class="form-group row">
                  <label
                    class="col-lg-3 col-form-label form-control-label"
                    style="text-align: center"
                    >About</label
                  >
                  <div class="col-lg-8">
                    <textarea
                      class="textareades form-control"
                      id="complexExampleMessage"
                      rows="2"
                      placeholder="Add more details about you"
                      v-model="teamform.description"
                    ></textarea>
                  </div>
                </div>
                <div class="form-group row">
                  <label
                    class="col-lg-3 col-form-label form-control-label"
                    style="text-align: center"
                    >Experience <span class="questionBadge">?</span></label
                  >
                  <div class="col-lg-8">
                    Logistics manager at Group Atlas
                    <br />Dec 2018-Present 2yr 10mos <br />Tijuana,Baja
                    California Mexico <br /><a
                      href="javascript:void(0)"
                      @click="autocom"
                      ><span>+ </span>Add experience</a
                    >
                  </div>
                </div>
                <div class="form-group row">
                  <label
                    class="col-lg-3 col-form-label form-control-label"
                    style="text-align: center"
                    >Education <span class="questionBadge">?</span></label
                  >
                  <div class="col-lg-8">
                    Technology manage
                    <br />Bachelor's degree,Industrial and Systems Engineering
                    <br />2010-2014 <br /><a
                      href="javascript:void(0)"
                      @click="autocom"
                      ><span>+ </span>Add education</a
                    >
                  </div>
                </div>
                <div class="form-group row">
                  <label
                    class="col-lg-3 col-form-label form-control-label"
                    style="text-align: center"
                    >Teams as planner
                    <span class="questionBadge">?</span></label
                  >
                  <div
                    class="col-lg-8"
                    v-for="(planner, i) in teammate.planner"
                    :key="i"
                  >
                    <span class="badge badge-primary badge-pill">{{
                      planner.user.name | short_hand
                    }}</span>
                    <span>{{ planner.user.name }}</span> <br /><a
                      href="javascript:void(0)"
                      @click="autocom"
                      ><span>+ </span>Add team</a
                    >
                  </div>
                </div>
                <div class="form-group row">
                  <label
                    class="col-lg-3 col-form-label form-control-label"
                    style="text-align: center"
                    >Teams as collaborator<span class="questionBadge"
                      >?</span
                    ></label
                  >
                  <div
                    class="col-lg-8"
                    v-for="(collaborator, i) in teammate.collaborator"
                    :key="i"
                  >
                    <span class="badge badge-primary badge-pill">{{
                      collaborator.user.name | short_hand
                    }}</span>
                    <span>{{ collaborator.user.name }}</span> <br /><a
                      href="javascript:void(0)"
                      @click="autocom"
                      ><span>+ </span>Add collaborator</a
                    >
                  </div>
                </div>
              </div>
            </form>

            <div class="card-footer mt-auto p-0">
              <ul class="text-center">
                <li>
                  <small>Predo Valdes create the team 6 days ago</small>
                </li>
                <li>
                  <small
                    >Predo Valdes added jose Luisas Planner 6 days ago</small
                  >
                </li>
                <li class="myreply text-right">
                  <small>Hola Equipo!</small>
                </li>
              </ul>
              <form class="sharebox">
                <div class="d-flex">
                  <label for="attach" class="my-auto mr-2"
                    ><i class="fas fa-paperclip h2 m-0 text-primary"></i
                  ></label>
                  <input type="file" name="attach" id="attach" />

                  <input
                    type="text"
                    name="question"
                    id="question"
                    class="form-control"
                    placeholder="Ask a question or post an update..."
                  />
                  <button class="btn btn-primary p-2 rounded-circle">
                    <i class="fas fa-paper-plane"></i>
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div
      class="modal fade"
      id="addNewTeammate"
      tabindex="-1"
      role="dialog"
      aria-labelledby="addNewTeammate"
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
              Invite people to your unit
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

          <form id="addNewTeammateForm" @submit.prevent="createTeammate()">
            <div class="modal-body" style="padding-top: 0">
              <h5>
                Your teammates will receive an email that gives them access
              </h5>
              <div class="form-group">
                <label style="font: normal normal 490 11px Montserrat"
                  >Email addresses:</label
                >
                <input
                  type="text"
                  name="email"
                  v-model="form.email"
                  class="form-control"
                  style="border-radius: 2px; margin-top: 5px"
                  autocomplete="off"
                  :class="{ 'is-invalid': form.errors.has('email') }"
                />
                <has-error :form="form" field="email"></has-error>
              </div>

              <div class="form-group">
                <label style="font: normal normal 490 11px Montserrat"
                  >Choose a starting team:</label
                >

                <select
                  name="team_id"
                  class="form-control js-example-basic-single"
                  :class="{ 'is-invalid': form.errors.has('team') }"
                >
                  <option value="">Select Team</option>
                  <option
                    v-for="(team, i) in teams.data"
                    :value="team.id"
                    :key="i"
                  >
                    {{ team.name }}
                  </option>
                </select>
                <has-error :form="form" field="team"></has-error>
              </div>
            </div>
            <div class="modal-footer">
              <a
                href="javascript::void(0);"
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
                class="btn btn-primary"
                style="
                  font: normal normal 490 14px Montserrat;
                  padding: 8px 12px;
                  height: auto;
                "
              >
                Send
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div
      class="modal fade"
      id="inviteModel"
      tabindex="-1"
      role="dialog"
      aria-labelledby="inviteModel"
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
              Invite people to your unit
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

          <form id="addNewTeammateForm" @submit.prevent="inviteTeammate()">
            <div class="modal-body" style="padding-top: 10px">
              <h5>
                Your teammates will receive an email that gives them access
              </h5>
              <div class="form-group">
                <label style="font: normal normal 490 11px Montserrat"
                  >Email addresses:</label
                >
                <input
                  type="text"
                  name="email"
                  v-model="inviteform.email"
                  class="form-control"
                  style="border-radius: 2px; margin-top: 5px"
                  autocomplete="off"
                  :class="{ 'is-invalid': inviteform.errors.has('email') }"
                />
                <has-error :form="inviteform" field="email"></has-error>
              </div>
            </div>
            <div class="modal-footer">
              <a
                href="javascript::void(0);"
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
                class="btn btn-primary"
                style="
                  font: normal normal 490 14px Montserrat;
                  padding: 8px 12px;
                  height: auto;
                "
              >
                Send
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div
      class="modal fade"
      id="addfield"
      tabindex="-1"
      role="dialog"
      aria-labelledby="addNewfield"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <chips/>
      </div>
    </div>
  </div>
</template>

<style scoped>
.switch {
  margin-top: 10px;
  margin-bottom: 10px;
  position: relative;
  display: inline-block;
  width: 40px;
  height: 22px;
}

.switch input {
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: 0.4s;
  transition: 0.4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 13px;
  width: 13px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: 0.4s;
  transition: 0.4s;
}

input:checked + .slider {
  background-color: #2196f3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196f3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(20px);
  -ms-transform: translateX(20px);
  transform: translateX(20px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
.button {
  width: 270px;
  height: 45px;
  font-family: "Roboto", sans-serif;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: 1px solid #c0c1c2;
  border-radius: 15px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
}
.wrap {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 10px;
}
.d-none {
  display: none;
}
.d-table {
  display: table;
}
.d-status {
  height: 100% !important;
}
</style>

<script>
import Chips from "./Chips";
import Multicollaborator from "./multi-collaborator";
import Multiselect from "./multiselect";

export default {
  components: {
    Multiselect,
    Multicollaborator,
    Chips,
  },
  props: ["id"],
  data() {
    return {
      img: require("../../img/custom.png"),
      flag: true,
      visible: true,
      editmode: false,
      statusupdated: false,
      newstatus: false,
      tags: {},
      teams: {},
      teammates: {},
      teamcount: {},
      completerow: "",
      unitData: {},
      unitstatus: {},
      tmp: 0,
      latestunitstatus: {},
      activeunitstatus: {},
      activeunitstatusid: 0,
      statustrack: { 1: "On Track", 2: "At Risk", 3: "Off Track" },
      open: false,
      current: 0,
      index: 0,
      suggestions: [
        { id: 1, name: "John Doe" },
        { id: 2, name: "Ravi" },
        { id: 3, name: "Smith" },
        { id: 4, name: "Pieter" },
      ],
      selection: "",
      form: new Form({
        id: "",
        unit_id: "",
        name: "",
      }),
      inviteform: new Form({
        id: "",
        unit_id: "",
        email: "",
        team_id: "",
        type: "",
      }),
      unitform: new Form({
        id: "",
        unit_name: "",
      }),
      myValue: "",
      myOptions: [
        { id: 1, text: "value1" },
        { id: 2, text: "value2" },
      ],
      planner_id: "",
      selectionautocolleb: "",
      openautocolleb: false,
      currentautocolleb: 0,
      suggestionsautocolleb: [
        { id: 1, name: "John Doe" },
        { id: 2, name: "Ravi" },
        { id: 3, name: "Smith" },
        { id: 4, name: "Pieter" },
      ],
      teamform: new Form({
        name: "",
        team_id: 0,
        unit_id: 0,
        description: "",
        planner: "",
        collaborator: "",
      }),
      statusform: new Form({
        id: "",
        unit_id: "",
        title: "",
        status: "1",
        custom_fields: [],
      }),
    };
  },
  filters: {
    short_hand(company_name) {
      var matches = company_name.match(/\b(\w)/g);
      var acronym = matches.join("");
      return acronym.toUpperCase(); // <-- The return value as Per logic
    },
  },
  computed: {
    inputListeners: function () {
      console.log(this.id);
    },
    matches() {
      return this.suggestions.filter((str) => {
        return str.name.indexOf(this.selection) >= 0;
      });
    },
    openSuggestion() {
      return (
        this.selection !== "" && this.matches.length != 0 && this.open === true
      );
    },
    matchesautocolleb() {
      return this.suggestionsautocolleb.filter((str) => {
        return str.name.indexOf(this.selectionautocolleb) >= 0;
      });
    },
    openSuggestionautocolleb() {
      return (
        this.selectionautocolleb !== "" &&
        this.matchesautocolleb.length != 0 &&
        this.openautocolleb === true
      );
    },
  },
  methods: {
    myChangeEvent(val) {
      console.log(val);
    },

    mySelectEvent({ id, text }) {
      console.log({ id, text });
    },
    loadOverview() {
      this.statusupdated = false;
      $("#input_unit_id").val(this.id);
      axios
        .get("/api/unit/overview", {
          params: {
            unit_id: this.id ? this.id : 0,
          },
        })
        .then(({ data }) => {
          this.teamcount = data.data.teamstatuscount;
          this.unitstatus = data.data.unitstatus;
          this.completerow = data.data.completerow;
          if (data.data.lastupdatestatus != null) {
            this.latestunitstatus = data.data.lastupdatestatus;
            if (this.latestunitstatus.custom_fields) {
              this.latestunitstatus.custom_fields = $.parseJSON(
                this.latestunitstatus.custom_fields
              );
            }
          }
          if (this.unitstatus.length > 0) {
            this.statusupdated = true;
          }
        });
    },
    getResults(page = 1) {
      this.$Progress.start();

      axios
        .get("/api/teams/list?page=" + page, {
          params: {
            unit_id: this.id,
          },
        })
        .then(({ data }) => {
          this.teams = data.data.teams;
          this.unitData = data.data.unitData;
        });

      this.$Progress.finish();
    },
    getUsers() {
      this.$Progress.start();

      axios.get("/api/teammates/members").then(({ data }) => {
        console.log(data);
        //this.suggestions = data.data.teams;
      });

      this.$Progress.finish();
    },

    loadTeams() {
      $("#input_unit_id").val(this.id);
      axios
        .get("/api/teams/list", {
          params: {
            unit_id: this.id ? this.id : 0,
          },
        })
        .then(({ data }) => {
          this.teams = data.data.teams;
          this.unitData = data.data.unitData;
          var temp = data.data.users;
        });
    },
    newModal() {
      this.editmode = false;
      this.form.reset();
      $("#addNewTeam").modal("show");
    },
    editUnitModal() {
      this.editmode = false;
      this.unitform.reset();
      this.unitform.id = this.id;
      this.unitform.unit_name = this.unitData.unit_name;

      $("#editUnitModal").modal("show");
    },
    duplicateModal() {
      this.editmode = false;
      this.unitform.reset();
      this.unitform.id = this.id;
      this.unitform.unit_name = this.unitData.unit_name;

      $("#duplicateModal").modal("show");
    },
    updatestatusModal() {
      this.editmode = false;
      this.newstatus = true;
      this.statusform.reset();
      this.activeunitstatus = {};
      this.activeunitstatusid = 0;
      this.statusform.status = 1;
      this.statusform.custom_fields = [
        { id: 0, title: "Summary", value: "", type: "text" },
        { id: 1, title: "What we've accomplished", value: "", type: "text" },
        { id: 2, title: "What's blocked", value: "", type: "text" },
        { id: 3, title: "Next Steps", value: "", type: "text" },
      ];
      $("#updatestatusModal").modal("show");
    },
    oldstatusModal(statusid) {
      this.activeunitstatusid = statusid;
      this.newstatus = false;
      this.unitstatus.map((value, key) => {
        if (value.id == statusid) {
          console.log(value);
          this.activeunitstatus = value;
          if (value.custom_fields) {
            this.activeunitstatus.custom_fields = $.parseJSON(
              value.custom_fields
            );
          }
        }
      });
    },
    updatestatusUnit() {
      this.editmode = false;
      console.log(this.statusform);
      this.statusform.unit_id = this.id;
      this.statusform
        .post("/api/unit/updateunitstatus")
        .then((data) => {
          $("#updatestatusModal").modal("hide");
          this.statusform.reset();
          Toast.fire({
            icon: "success",
            title: data.data.message,
          });
          this.$Progress.finish();
          this.loadTeams();
          this.loadOverview();
        })
        .catch(() => {
          Toast.fire({
            icon: "error",
            title: "Some error occured! Please try again",
          });
        });
    },
    customize() {
      console.log("customize");
      this.visible = !this.visible;
      console.log(this.visible);
    },
    customize_teammates() {
      console.log("customize");
      this.flag = !this.flag;
      console.log(this.visible);
    },
    duplicateUnit() {
      this.$Progress.start();
      this.unitform.unit_id = this.id;
      this.unitform
        .post("/api/unit/duplicateunit")
        .then((data) => {
          $("#duplicateModal").modal("hide");

          Toast.fire({
            icon: "success",
            title: data.data.message,
          });
          this.$Progress.finish();
          this.$router.push("/teams/" + data.data.data.id);
          this.loadTeams();
        })
        .catch(() => {
          Toast.fire({
            icon: "error",
            title: "Some error occured! Please try again",
          });
        });
    },
    updateUnit() {
      this.$Progress.start();
      this.unitform.unit_id = this.id;
      this.unitform
        .post("/api/unit/updateunit")
        .then((data) => {
          $("#editUnitModal").modal("hide");

          Toast.fire({
            icon: "success",
            title: data.data.message,
          });
          this.$Progress.finish();
          this.loadTeams();
        })
        .catch(() => {
          Toast.fire({
            icon: "error",
            title: "Some error occured! Please try again",
          });
        });
    },
    createTeam() {
      this.$Progress.start();
      this.form.unit_id = this.id;
      this.form
        .post("/api/teams/store")
        .then((data) => {
          $("#addNewTeam").modal("hide");

          Toast.fire({
            icon: "success",
            title: data.data.message,
          });
          this.$Progress.finish();
          this.loadTeams();
        })
        .catch(() => {
          Toast.fire({
            icon: "error",
            title: "Some error occured! Please try again",
          });
        });
    },
    deleteProduct() {
      Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        showCancelButton: true,
        confirmButtonColor: "#d33",
        cancelButtonColor: "#3085d6",
        confirmButtonText: "Yes, delete it!",
      }).then((result) => {
        axios
          .post("/api/unit/removeteam", {
            unit_id: this.id ? this.id : 0,
          })
          .then(({ data }) => {
            //   window.location.reload();
          });
      });
    },
    createTeammate() {
      this.$Progress.start();
      this.form.unit_id = this.id;
      this.form
        .post("/api/teammates/store")
        .then((data) => {
          $("#addNewTeammate").modal("hide");

          Toast.fire({
            icon: "success",
            title: data.data.message,
          });
          this.$Progress.finish();
          this.loadTeammates();
        })
        .catch(() => {
          Toast.fire({
            icon: "error",
            title: "Some error occured! Please try again",
          });
        });
    },
    newTeammateModal() {
      this.editmode = false;
      this.form.reset();
      $("#addNewTeammate").modal("show");
    },
    toggleCteammates(id) {
      $("#teammateprofilelist_" + id).toggleClass("show");
    },
    toggleContainer(id) {
      // if (this.tmp && this.tmp != id)
      //    $("#profilelist_" + this.tmp).toggleClass("show");
      // if (id)
      $("#profilelist_" + id).toggleClass("show");
      this.tmp = id;
    },
    enter() {
      this.selection = this.matches[this.current];
      this.open = false;
    },

    //When up pressed while suggestions are open
    up() {
      if (this.current > 0) this.current--;
    },

    //When up pressed while suggestions are open
    down() {
      if (this.current < this.suggestions.length - 1) this.current++;
    },

    //For highlighting element
    isActive(index) {
      return index === this.current;
    },

    //When the user changes input
    change() {
      if (this.open == false) {
        this.open = true;
        this.current = 0;
        if (this.open == true) {
          $("#suggestionul").show();
        }
      }
    },

    //When one of the suggestion is clicked
    suggestionClick(index, value) {
      console.log(value);
      this.selection = value; //this.matches[index];
      $("#planner").val(index);
      this.open = false;
      if (this.open == false) {
        $("#suggestionul").hide();
      }
    },
    autocom() {
      $(".autocom").toggle();
    },
    inviteModel(teamId, type) {
      this.editmode = false;
      this.inviteform.team_id = teamId;
      this.inviteform.type = type;
      //$('#team_id').val(teamId);

      $("#inviteModel").modal("show");
    },
    inviteTeammate() {
      this.$Progress.start();
      this.inviteform.unit_id = this.id;
      this.inviteform
        .post("/api/teammates/store")
        .then((data) => {
          $("#inviteModel").modal("hide");

          Toast.fire({
            icon: "success",
            title: data.data.message,
          });
          this.$Progress.finish();
        })
        .catch(() => {
          Toast.fire({
            icon: "error",
            title: "Some error occured! Please try again",
          });
        });
    },

    isActiveautocolleb(index) {
      return index === this.currentautocolleb;
    },
    enterautocolleb() {
      this.selectioautocolleb = this.matches[this.currentautocolleb];
      this.openautocolleb = false;
    },

    //When up pressed while suggestions are open
    upautocolleb() {
      if (this.currentautocolleb > 0) this.currentautocolleb--;
    },

    //When up pressed while suggestions are open
    downautocolleb() {
      if (this.currentautocolleb < this.suggestionsautocolleb.length - 1)
        this.currentautocolleb++;
    },

    //When the user changes input
    changeautocolleb() {
      if (this.openautocolleb == false) {
        this.openautocolleb = true;
        this.currentautocolleb = 0;
        if (this.openautocolleb == true) {
          $("#suggestionulautocolleb").show();
        }
      }
    },

    //When one of the suggestion is clicked
    suggestionautocollebClick(index, value) {
      console.log(value + "here");
      this.selectionautocolleb = value; //this.matches[index];
      $("#colleborator").val(index);
      this.openautocolleb = false;
      if (this.openautocolleb == false) {
        $("#suggestionulautocolleb").hide();
      }
    },
    autocolleb() {
      $(".autocolleb").toggle();
    },

    submitTeamEdit() {
      var team_id = $("#team_id").val();
      this.$Progress.start();
      this.teamform.name = $("#team_name").val();
      this.teamform.unit_id = this.id;
      this.teamform.description = $("#complexExampleMessage").val();
      this.teamform.collaborator = this.collaborator_value;
      this.teamform.planner = this.planner_value;
      this.teamform.team_id = team_id;
      console.log(this.teamform);
      this.teamform
        .post("/api/teams/saveplanner")
        .then((data) => {
          Toast.fire({
            icon: "success",
            title: data.data.message,
          });
          this.$Progress.finish();
          window.location.reload();
          //this.$router.push('/teams/'+data.data.data.id)
          //this.loadTeams();
        })
        .catch(() => {
          Toast.fire({
            icon: "error",
            title: "Some error occured! Please try again",
          });
        });
    },
    loadTeammates() {
      axios
        .get("/api/teammates/list", {
          params: {
            unit_id: this.id ? this.id : 0,
          },
        })
        .then(({ data }) => {
          this.teammates = data.data.teammates;
        });
    },
    getTeams(unit_id, user_id) {
      axios
        .get("/api/teammates/getteamdata", {
          params: {
            unit_id: unit_id,
            user_id: user_id,
          },
        })
        .then(({ data }) => {
          return data;
        });
    },
    add_field() {
      $("#addfield").modal("show");
    },
  },
  watch: {
    id(newValue) {
      console.log(newValue);
      this.loadTeams();
      this.loadTeammates();
    },
    "$route.params": {
      handler(newValue) {
        const { id } = newValue;
        console.log(newValue);
        // this.loadOverview();
        console.log(this);
      },
      immediate: true,
    },
  },
  mounted() {
    console.log(this.id);
    $("#input_unit_id").val(this.id);
    if (this.open == false) {
      $("#suggestionul").hide();
    }

    if (this.openautocolleb == false) {
      $("#suggestionulautocolleb").hide();
    }
  },
  created() {
    this.$Progress.start();

    // this.loadTeams();
    // // this.loadOverview();
    // //this.getUsers();

    // this.loadTeammates();
    this.$Progress.finish();
  },
};
</script>
