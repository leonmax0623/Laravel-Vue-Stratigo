<template>
  <div>
    <div class="tab-content" id="myTabContent">
      <div
        class="tab-pane fade show active"
        id="team"
        role="tabpanel"
        aria-labelledby="team-tab"
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
            <button type="button" class="btn btn-primary" @click="newModal">
              <span>+ </span>Add Team
            </button>
          </div>
          <div>
            <a href="#" class="mr-3"
              ><i class="mdi mdi-progress-check"></i> All Teams</a
            >
            <a href="#" class="mr-3"
              ><i class="mdi mdi-filter-variant"></i> Filter</a
            >
            <a href="#" class="mr-3"><i class="mdi mdi-sort"></i> Sort</a>
            <a href="#" @click="customize()" class="mr-3"
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
                <th colspan="2" class="border-right" width="45%">Team name</th>
                <th class="border-right">Planner</th>
                <th class="border-right">Collaborators</th>
                <th class="border-right">Assignee</th>
                <th><i class="fa fa-plus" aria-hidden="true"></i></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="team in teams.data" :key="team.id">
                <td
                  colspan="2"
                  class="border-right tablehead h5 font-weight-bold teamtdtitle"
                  @click="toggleContainer(team.id)"
                >
                  <i
                    class="fa fa-users to"
                    aria-hidden="true"
                    id="navbarSideButton"
                    style="color: #8dc6ff; margin-right: 10px"
                  ></i>

                  <a style="color: #613629; cursor: pointer">
                    {{ team.name }}
                  </a>
                </td>
                <td style="text-align: center">{{ team.planner_count }}</td>
                <td style="text-align: center">
                  {{ team.collaborator_count }}
                </td>
                <td style="text-align: center">
                  <span class="badge badge-primary badge-pill">
                    {{ team.user.name | short_hand }}
                  </span>
                  {{ team.user.name }}
                </td>
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
            v-bind:class="{ 'd-table': !visible, 'd-none': visible }"
          >
            <h4 style="margin-bottom: 30px">Customize</h4>
            <div style="display: flex">
              <h2 style="font-size: 15px; width: 50%">Fields</h2>
              <a
                href="#"
                @click="add_field()"
                style="width: 50%; text-align: right"
                >+Add field</a
              >
            </div>

            <div class="wrap button">
              <div style="width: 70%">
                <img style="width: 10px" src="../../img/custom.png" />
                Planners
              </div>

              <label class="switch">
                <input type="checkbox" checked />
                <span class="slider round"></span>
              </label>
            </div>
            <div class="wrap button">
              <div style="width: 70%">
                <img style="width: 10px" src="../../img/custom.png" />
                Collaborator
              </div>

              <label class="switch">
                <input type="checkbox" checked />
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
                <input type="checkbox" checked />
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
            :data="teams"
            @pagination-change-page="getResults"
          ></pagination>
        </div>
        <div
          class="side-options-overlay overlay collapse"
          v-for="(team, i) in teams.data"
          :id="'profilelist_' + team.id"
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
              <input type="hidden" id="team_id" :value="team.id" />
              <input type="hidden" id="team_name" :value="team.name" />
              <div class="card-header d-flex justify-content-between">
                <div style="width: 87%">
                  <h4 class="d-inline-block">
                    <i class="fa fa-users to" aria-hidden="true"></i>
                    {{ team.name }}
                  </h4>
                  <a href="#" class="h6"
                    ><i
                      class="fa fa-circle text-success"
                      aria-hidden="true"
                    ></i>
                    On Track</a
                  >
                </div>
                <div style="display: flex">
                  <!--a href="#" class="h4 ml-3"><i class="mdi mdi-more text-primary" aria-hidden="true"></i></a-->
                  <div class="dropdown">
                    <a
                      href="#"
                      id="dropdownMenuButton"
                      data-toggle="dropdown"
                      aria-haspopup="true"
                      aria-expanded="false"
                    >
                      <img src="../../img/edit.png" />
                    </a>
                    <div
                      class="dropdown-menu"
                      aria-labelledby="dropdownMenuButton"
                    >
                      <a class="dropdown-item" href="#" @click="submitTeamEdit"
                        ><i
                          class="fas fa-pencil-alt"
                          style="margin-right: 5px"
                        ></i>
                        <span style="font-family: 'Spartan', sans-serif"
                          >Edit unit details</span
                        ></a
                      >
                      <a class="dropdown-item" href="#" @click="duplicateModal"
                        ><i class="fas fa-copy" style="margin-right: 5px"></i>
                        <span style="font-family: 'Spartan', sans-serif"
                          >Duplicate</span
                        ></a
                      >
                      <a
                        class="dropdown-item"
                        href="javascript::void(0);"
                        onclick="event.preventDefault();
                        document.getElementById('export-csv').submit();"
                      >
                        <i class="fas fa-print" style="margin-right: 5px"></i>
                        <span style="font-family: 'Spartan', sans-serif"
                          >Export CSV</span
                        >
                      </a>
                      <a class="dropdown-item" href="#"
                        ><i class="fas fa-print" style="margin-right: 5px"></i>
                        <span style="font-family: 'Spartan', sans-serif"
                          >Export PDF</span
                        ></a
                      >
                      <a class="dropdown-item" href="#"
                        ><i
                          class="fas fa-archive"
                          style="margin-right: 5px"
                        ></i>
                        <span style="font-family: 'Spartan', sans-serif"
                          >Archive</span
                        ></a
                      >
                      <a
                        class="dropdown-item"
                        @click="deleteProduct"
                        href="#"
                        style="color: #d7525c"
                        ><i class="fas fa-trash" style="margin-right: 5px"></i>
                        <span style="font-family: 'Spartan', sans-serif"
                          >Delete</span
                        ></a
                      >
                    </div>
                  </div>
                  <a
                    href="#"
                    class="h4 ml-3 overlay-close"
                    @click="toggleContainer(team.id)"
                    ><i
                      class="mdi mdi-arrow-collapse-right text-primary"
                      aria-hidden="true"
                    ></i
                  ></a>
                </div>
              </div>
              <div
                class="card-body"
                style="overflow-y: scroll; padding-top: 25px"
              >
                <div class="form-group" style="margin-bottom: 0px">
                  <label
                    class="col-form-label form-control-label"
                    style="width: 19%; padding-left: 16px"
                    >Assignee</label
                  >
                  <span class="badge badge-primary badge-pill">
                    {{ team.user.name | short_hand }}
                  </span>
                  <span>{{ team.user.name }}</span>
                </div>
                <div
                  class="form-group"
                  style="display: flex; margin-bottom: 0px"
                >
                  <label
                    class="col-lg-2 col-form-label form-control-label"
                    style="display: flex; align-items: center"
                    >Description</label
                  >
                  <div class="col-lg-10">
                    <textarea
                      class="textareades form-control"
                      id="complexExampleMessage"
                      rows="2"
                      placeholder="Add more details to team"
                      v-model="teamform.description"
                    ></textarea>
                  </div>
                </div>
                <div class="form-group" style="margin-bottom: 0px">
                  <label
                    class="col-form-label form-control-label"
                    style="padding-left: 16px"
                    >Planners <span class="questionBadge">?</span></label
                  >
                </div>
                <div class="form-group" style="margin-bottom: 0px">
                  <div class="col-lg-2"></div>
                  <div
                    class="col-lg-2"
                    v-for="(planner, i) in team.planner"
                    :key="i"
                  >
                    <!-- { if(planner_team.unit_id==team.unit_id && planner_team.name==team.name)} -->
                    <span class="badge badge-primary badge-pill">{{
                      planner.user.name | short_hand
                    }}</span>
                    <span>{{ planner.user.name }}</span>
                  </div>
                </div>

                <div
                  class="form-group"
                  style="display: flex; margin-bottom: 0px"
                >
                  <div style="text-align: center; width: 30%">
                    <div class="content">
                      <a href="javascript:void(0)" @click="autocom"
                        ><span>+ </span>Add Planner</a
                      >
                    </div>
                  </div>
                  <div class="form-group autocom" style="display: none">
                    <div
                      style="position: relative"
                      v-bind:class="{ open: openSuggestion }"
                    ></div>
                    <multiselect :getPlanner="getPlanner"></multiselect>
                    <a href="#" @click="inviteModel(team.id, 'collaborator')"
                      ><span>+ </span> Invite teammates via email</a
                    >
                  </div>
                </div>
                <div class="form-group" style="margin-bottom: 0px">
                  <label
                    class="col-form-label form-control-label"
                    style="padding-left: 16px"
                    >Collaborators <span class="questionBadge">?</span></label
                  >
                </div>
                <div class="form-group" style="margin-bottom: 0px">
                  <div class="col-lg-2"></div>
                  <div
                    class="col-lg-2"
                    v-for="(colleborator, i) in team.colleborator"
                    :key="i"
                  >
                    <span class="badge badge-primary badge-pill">{{
                      colleborator && colleborator.user.name | short_hand
                    }}</span>
                    <span>{{ colleborator && colleborator.user.name }}</span>
                  </div>
                </div>

                <div
                  class="form-group"
                  style="display: flex; margin-bottom: 0px"
                >
                  <div style="text-align: center; width: 30%">
                    <div class="content">
                      <a href="javascript:void(0)" @click="autocolleb"
                        ><span>+ </span>Add Collaborator</a
                      >
                    </div>
                  </div>
                  <div class="form-group autocolleb" style="display: none">
                    <div
                      style="position: relative"
                      v-bind:class="{ open: openSuggestionautocolleb }"
                    >
                      <Multicollaborator></Multicollaborator>
                      <a href="#" @click="inviteModel(team.id, 'collaborator')"
                        ><span>+ </span> Invite teammates via email</a
                      >
                    </div>
                  </div>
                </div>
                <div class="form-group" style="margin-bottom: 0px">
                  <label
                    class="col-form-label form-control-label"
                    style="padding-left: 16px"
                    >Viewer <span class="questionBadge">?</span></label
                  >
                </div>
                <div class="form-group" style="margin-bottom: 0px">
                  <div class="col-lg-2"></div>
                  <div
                    class="col-lg-2"
                    v-for="(colleborator, i) in team.colleborator"
                    :key="i"
                  >
                    <span class="badge badge-primary badge-pill">{{
                      colleborator && colleborator.user.name | short_hand
                    }}</span>
                    <span>{{ colleborator && colleborator.user.name }}</span>
                  </div>
                </div>

                <div
                  class="form-group"
                  style="display: flex; margin-bottom: 0px"
                >
                  <div style="text-align: center; width: 30%">
                    <div class="content">
                      <a href="javascript:void(0)" @click="autocolleb"
                        ><span>+ </span>Add Viewer</a
                      >
                    </div>
                  </div>
                  <div class="form-group autocolleb" style="display: none">
                    <div
                      style="position: relative"
                      v-bind:class="{ open: openSuggestionautocolleb }"
                    >
                      <a href="#" @click="inviteModel(team.id, 'collaborator')"
                        ><span>+ </span> Invite teammates via email</a
                      >
                    </div>
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
      id="addNewTeam"
      tabindex="-1"
      role="dialog"
      aria-labelledby="addNewTeam"
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
              Add Team
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

          <form id="addNewTeamForm" @submit.prevent="createTeam()">
            <div class="modal-body" style="padding-top: 0">
              <div class="form-group">
                <label style="font: normal normal 490 11px Montserrat"
                  >Name of the team:</label
                >
                <input
                  type="text"
                  name="name"
                  v-model="form.name"
                  class="form-control"
                  style="border-radius: 2px; margin-top: 5px"
                  autocomplete="off"
                  :class="{ 'is-invalid': form.errors.has('name') }"
                />
                <has-error :form="form" field="name"></has-error>
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
                Add Team
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
      id="add_field"
      tabindex="-1"
      role="dialog"
      aria-labelledby="addNewfield"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <chips />
      </div>
    </div>
    <div
      class="modal fade"
      id="duplicateModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="duplicateModal"
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
              Duplicate Unit
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

          <form id="duplicate" @submit.prevent="duplicate()">
            <div class="modal-body" style="padding-top: 0">
              <div class="form-group">
                <label style="font: normal normal 490 11px Montserrat"
                  >Rename of the unit:</label
                >
                <input
                  type="text"
                  name="unit_name"
                  class="form-control"
                  style="border-radius: 2px; margin-top: 5px"
                  autocomplete="off"
                />
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
                Copy
              </button>
            </div>
          </form>
        </div>
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

.dropdown-menu {
  transform: translate3d(-30 px, 22 px, 0 px);
  left: -25px !important;
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
import Chips from "./Chips.vue";
import Multicollaborator from "./multi-collaborator";
import Multiselect from "./multiselect";

export default {
  components: {
    Multiselect,
    Multicollaborator,
    Chips,
  },

  props: {
    id: Number,
  },
  data() {
    return {
      visible: true,
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
        });
    },
    newModal() {
      this.form.reset();
      $("#addNewTeam").modal("show");
    },
    updatestatusModal() {
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
      $("#add_field").modal("show");
    },
    getPlanner(items) {
      console.log(items);
    },
    duplicateModal() {
      $("#duplicateModal").modal("show");
    },
    duplicate() {},
    deleteProduct() {
      Swal.fire(
        {
          title: "Are you sure?",
          text: "You won't be able to revert this!",
          showCancelButton: true,
          confirmButtonColor: "#d33",
          cancelButtonColor: "#3085d6",
          confirmButtonText: "Yes, delete it!",
          closeOnConfirm: false,
          closeOnCancel: false,
        },
        function (isconfirm) {
          if (isconfirm) {
            axios
              .post("/api/unit/removeteam", {
                unit_id: this.id ? this.id : 0,
              })
              .then(({ data }) => {
                window.location.reload();
              });
            return true;
          }
          return false;
        }
      );
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
        // this.loadOverview();
        console.log(this.id);
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
$(document).ready(function () {});
</script>
