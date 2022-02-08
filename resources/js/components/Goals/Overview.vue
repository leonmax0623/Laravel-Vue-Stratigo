<template>
  <div>
    <div class="tab-content" id="myTabContent">
      <div
        class="tab-pane fade show active"
        id="home"
        role="tabpanel"
        aria-labelledby="home-tab"
      >
        <div class="container-fluid">
          <div class="row">
            <div class="col-xl-6 col-md-6">
              <div
                class="
                  row
                  d-flex
                  justify-content-between
                  align-items-center
                  px-lg-4
                  py-lg-3
                  px-3
                  py-2
                "
              >
                <div class="col-xl-6 col-md-6">
                  <div class="card-box">
                    <div class="widget-chart-1">
                      <div class="widget-detail-1 text-center">
                        <h6 class="font-weight-normal pt-2 mb-1">2</h6>
                        <p class="text-muted mb-1">Planners</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-xl-6 col-md-6">
                  <div class="card-box">
                    <div class="widget-chart-1">
                      <div class="widget-detail-1 text-center">
                        <h6 class="font-weight-normal pt-2 mb-1">10</h6>
                        <p class="text-muted mb-1">Collaborators</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="table-responsive">
                <table class="table mb-0 table-card">
                  <thead>
                    <tr>
                      <th>&nbsp;</th>
                      <th>
                        <a href="#" class="h7"
                          ><i
                            class="fa fa-circle text-success"
                            aria-hidden="true"
                          ></i>
                          On Track</a
                        >
                      </th>
                      <th>
                        <a href="#" class="h7"
                          ><i
                            class="fa fa-circle text-warning"
                            aria-hidden="true"
                          ></i>
                          At Risk</a
                        >
                      </th>
                      <th>
                        <a href="#" class="h7"
                          ><i
                            class="fa fa-circle text-danger"
                            aria-hidden="true"
                          ></i>
                          Off Track</a
                        >
                      </th>
                      <th><a href="#" class="h7">En Total</a></th>
                    </tr>
                  </thead>
                  <tbody class="cardbx">
                    <tr>
                      <th scope="row">Teams</th>
                      <td>{{ teamcount.ontrack }}</td>
                      <td>{{ teamcount.atrisk }}</td>
                      <td>{{ teamcount.offtrack }}</td>
                      <td>{{ teamcount.total }}</td>
                    </tr>
                    <tr>
                      <th scope="row">Goals</th>
                      <td>0</td>
                      <td>0</td>
                      <td>0</td>
                      <td>0</td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <div
                class="d-flex justify-content-between py-lg-3 px-3 py-2 mt-3"
              >
                <div>
                  <h6><b>Latest Update</b></h6>
                </div>
                <div>
                  <button
                    type="button"
                    @click="updatestatusModal()"
                    class="btn btn-primary"
                  >
                    Update Status
                  </button>
                </div>
              </div>

              <div class="py-lg-3" v-show="statusupdated">
                <div class="col-xl-12 col-md-12">
                  <div class="card-box card-with-border">
                    <h6 class="header-title mt-0 mb-4">
                      <b>The unit was created</b>
                    </h6>
                    <div class="mb-4">
                      <span class="badge badge-warning badge-pill">DG</span>
                      <a href="#">{{ latestunitstatus.title }}</a>
                      <span class="small-10">{{
                        latestunitstatus.created
                      }}</span>
                    </div>

                    <div class="widget-chart-1">
                      <div class="widget-detail-1">
                        <div class="text-left mb-4">
                          <p class="text-muted font-13">
                            <strong>Status :</strong>
                            <span class="ml-2">
                              <a href="#"
                                ><i
                                  class="fa fa-circle text-success"
                                  aria-hidden="true"
                                ></i>
                                {{ statustrack[latestunitstatus.status] }}</a
                              >
                            </span>
                          </p>

                          <p class="text-muted font-13">
                            <strong>Owner :</strong
                            ><span class="ml-2"
                              ><a href="#" class="h7">
                                {{
                                  teamcount.user ? teamcount.user.name : ""
                                }}</a
                              ></span
                            >
                          </p>
                        </div>
                        <div class="text-left mb-4">
                          <h4 class="header-title mt-0 mb-4">
                            {{
                              latestunitstatus.custom_fields
                                ? latestunitstatus.custom_fields[0].title
                                : ""
                            }}
                          </h4>
                          <p class="text-muted font-13">
                            {{
                              latestunitstatus.custom_fields
                                ? latestunitstatus.custom_fields[0].value
                                : ""
                            }}
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="py-lg-3" v-show="statusupdated">
                <div class="col-xl-12 col-md-12">
                  <div class="header-title mt-0 mb-4">
                    <strong>The unit was created</strong>
                    <a href="javascript::void(0);" class="h7">View all</a>
                  </div>

                  <div class="mb-4">
                    <div v-html="completerow"></div>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-xl-6 col-md-6">
              <div
                class="side-options-overlay overlay collapse show"
                id="profilelist"
                style="top: 0px; width: 110%; position: inherit; left: -30px"
              >
                <div
                  class="card card-outline-secondary h-100 border-0"
                  v-bind:class="{ 'd-status': statusupdated }"
                >
                  <form
                    autocomplete="off"
                    id="myForm"
                    class="form"
                    role="form"
                    @submit.prevent="submitTeamEdit()"
                  >
                    <div class="card-header d-flex justify-content-between">
                      <div style="width: 87%">
                        <h4 class="d-inline-block" v-if="teamid">
                          <i class="fa fa-users to" aria-hidden="true"></i>
                          {{ teamData.name }}
                        </h4>
                        <h4 class="d-inline-block" v-else>
                          <i class="fa fa-users to" aria-hidden="true"></i>
                          {{ unitData.unit_name }}
                        </h4>
                        <a href="#" class="h6"
                          ><i
                            class="fa fa-circle text-success"
                            aria-hidden="true"
                          ></i>
                          On Track</a
                        >
                      </div>
                      <div style="width: 13%; display: flex">
                        <!--a href="#" class="h4 ml-3"><i class="mdi mdi-more text-primary" aria-hidden="true"></i></a-->
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
                          class="dropdown-menu dropdownMenuButton"
                          aria-labelledby="dropdownMenuButton"
                        >
                          <a
                            class="dropdown-item"
                            href="#"
                            @click="submitTeamEdit()"
                            ><i
                              class="fas fa-save"
                              style="margin-right: 5px"
                            ></i>
                            <span style="font-family: 'Spartan', sans-serif"
                              >Set status</span
                            ></a
                          >
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
                    <div class="card-body" style="overflow-y: scroll">
                      <div class="form-group row" style="margin: 0px">
                        <label
                          class="col-form-label form-control-label"
                          style="padding-left: 18px"
                          >Assignee</label
                        >&nbsp;&nbsp;
                        <div class="col-lg-8">
                          <!-- <span class="badge badge-primary badge-pill">
                            {{ user.name | short_hand }}
                          </span> -->
                          <span>{{ user.name }}</span>
                        </div>
                      </div>
                      <div class="form-group row" style="margin: 0px">
                        <label
                          class="col-form-label form-control-label"
                          style="
                            text-align: center;
                            padding-left: 17px;
                            padding-top: 15px;
                          "
                          >Description</label
                        >
                        &nbsp;
                        <div style="width: 80%">
                          <textarea
                            class="textareades form-control"
                            id="complexExampleMessage"
                            rows="2"
                            placeholder="Add more details to team"
                          ></textarea>
                        </div>
                      </div>
                      <div class="form-group row" style="margin: 0px">
                        <label
                          class="col-form-label form-control-label"
                          style="padding-top: 0px; padding-bottom: 0px"
                          ><img
                            style="width: 20px; padding-right: 10px"
                            src="../../img/custom.png"
                          />Purpose</label
                        >
                        <div
                          style="
                            width: 95%;
                            padding-left: 30px;
                            position: relative;
                          "
                        >
                          <v-text-field
                            label="Add more details..."
                            single-line
                          ></v-text-field>
                        </div>
                      </div>
                      <div class="form-group row" style="margin: 0px">
                        <label
                          class="col-form-label form-control-label"
                          style="padding-top: 0px; padding-bottom: 0px"
                          ><img
                            style="width: 20px; padding-right: 10px"
                            src="../../img/custom.png"
                          />Values</label
                        >
                        <div
                          style="
                            width: 95%;
                            padding-left: 30px;
                            position: relative;
                          "
                        >
                          <v-text-field
                            label="Add more details..."
                            single-line
                          ></v-text-field>
                        </div>
                      </div>
                      <div class="form-group row" style="margin: 0px">
                        <label
                          class="col-form-label form-control-label"
                          style="padding-bottom: 0px"
                          ><img
                            style="width: 20px; padding-right: 10px"
                            src="../../img/custom.png"
                          />Value proposition</label
                        >
                        <div
                          style="
                            width: 95%;
                            padding-left: 30px;
                            position: relative;
                          "
                        >
                          <v-text-field
                            label="Add more details..."
                            single-line
                          ></v-text-field>
                        </div>
                      </div>
                      <div>
                        <button type="button" class="btn btn-default-cs">
                          +
                        </button>
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
                          >Predo Valdes added jose Luisas Planner 6 days
                          ago</small
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
        </div>
      </div>
    </div>

    <div
      class="modal fade"
      id="updatestatusModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="updatestatusModal"
      aria-hidden="true"
    >
      <div
        class="modal-dialog"
        role="document"
        style="max-width: 70%; min-height: 500px"
      >
        <div class="modal-content" style="min-height: 500px">
          <div
            class="modal-header"
            style="padding: 20px 15px; margin: 0px; background: #fff"
          >
            <h5
              class="modal-title"
              style="
                display: inline-block;
                font: normal normal 600 16px/26px Montserrat;
              "
            >
              Status updates
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

          <div
            class="col-md-12"
            style="padding: 0; display: inline-flex; min-height: 500px"
          >
            <div
              class="col-md-3"
              style="padding: 0; border-right: 1px solid #dee2e6"
            >
              <div
                v-for="unitstat in unitstatus"
                :key="unitstat.id"
                v-bind:class="[
                  unitstat.id == activeunitstatusid
                    ? 'activeupdate'
                    : 'inactiveupdate',
                ]"
                @click="oldstatusModal(unitstat.id)"
              >
                <h3
                  style="
                    padding: 15px;
                    font: 500 16px / 26px Montserrat;
                    cursor: pointer;
                  "
                >
                  {{ unitstat ? unitstat.title : "" }}
                </h3>
                <div class="col-md-12" style="display: inline-flex; padding: 0">
                  <div class="col-md-7">
                    <p style="font-size: 12px">
                      {{ statustrack ? statustrack[unitstat.status] : "" }}
                    </p>
                  </div>
                  <div class="col-md-5" style="text-align: right">
                    <p style="font-size: 12px">{{ unitstat.created }}</p>
                  </div>
                </div>
              </div>
              <div
                class=""
                @click="updatestatusModal()"
                v-bind:class="[newstatus ? 'activeupdate' : 'inactiveupdate']"
              >
                <h3
                  style="
                    text-align: center;
                    margin-top: 38px;
                    font-size: 16px;
                    font-weight: 500;
                    font-family: 'Spartan', sans-serif;
                    cursor: pointer;
                  "
                >
                  <i class="fa fa-plus"></i> Add Update
                </h3>
              </div>
            </div>
            <div class="col-md-9" style="padding-top: 15px">
              <div v-show="!newstatus">
                <div class="" v-show="statusupdated">
                  <div class="col-xl-12 col-md-12">
                    <div class="">
                      <h6 class="header-title mt-0 mb-4">
                        <b>{{
                          activeunitstatus ? activeunitstatus.title : ""
                        }}</b>
                      </h6>
                      <div class="mb-4">
                        <span class="badge badge-warning badge-pill">DG</span>
                        <a href="#">{{
                          activeunitstatus ? activeunitstatus.title : ""
                        }}</a>
                        <span class="small-10">{{
                          activeunitstatus ? activeunitstatus.created : ""
                        }}</span>
                      </div>

                      <div class="widget-chart-1">
                        <div class="widget-detail-1">
                          <div class="text-left mb-4">
                            <p class="text-muted font-13">
                              <strong>Status :</strong>
                              <span class="ml-2">
                                <a href="#"
                                  ><i
                                    class="fa fa-circle text-success"
                                    aria-hidden="true"
                                  ></i>
                                  {{
                                    activeunitstatus
                                      ? statustrack[activeunitstatus.status]
                                      : ""
                                  }}</a
                                >
                              </span>
                            </p>

                            <p class="text-muted font-13">
                              <strong>Responsible :</strong
                              ><span class="ml-2"
                                ><a href="#" class="h7">
                                  {{
                                    teamcount.user ? teamcount.user.name : ""
                                  }}</a
                                ></span
                              >
                            </p>
                          </div>
                          <div
                            class="text-left mb-4"
                            v-for="activeunitstat in activeunitstatus.custom_fields"
                            :key="activeunitstat.id"
                          >
                            <h4 class="header-title mt-0 mb-4">
                              {{ activeunitstat ? activeunitstat.title : "" }}
                            </h4>
                            <p class="text-muted font-13">
                              {{ activeunitstat ? activeunitstat.value : "" }}
                            </p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <form
                id="updatestatusUnitForm"
                @submit.prevent="updatestatusUnit()"
                v-show="newstatus"
              >
                <div class="modal-body" style="padding-top: 0">
                  <div class="form-group">
                    <input
                      type="text"
                      name="title"
                      v-model="statusform.title"
                      class="form-control"
                      style="border-radius: 2px; margin-top: 5px"
                      autocomplete="off"
                      :class="{
                        'is-invalid': statusform.errors.has('title'),
                      }"
                      placeholder="Title of update"
                    />
                    <has-error :form="statusform" field="title"></has-error>
                  </div>

                  <div class="form-group">
                    <label>Status:</label>
                    <select
                      class="form-control"
                      name="status"
                      v-model="statusform.status"
                    >
                      <option value="1">
                        <i class="fa fa-plus" aria-hidden="true"></i> On Track
                      </option>
                      <option value="2">At Risk</option>
                      <option value="3">Off Track</option>
                    </select>
                    <has-error :form="statusform" field="status"></has-error>
                  </div>

                  <div class="form-group" style="display: inline-flex">
                    <label>Owner:</label>
                    <p>{{ teamcount.user ? teamcount.user.name : "" }}</p>
                  </div>

                  <div
                    v-for="(custom_field, index) in statusform.custom_fields"
                    :key="custom_field.id"
                    style="margin-bottom: 20px"
                  >
                    <div
                      class="col-md-12"
                      style="display: inline-flex; padding: 0px; margin: 0px"
                    >
                      <div class="col-md-11" style="padding: 0">
                        {{ custom_field.title ? custom_field.title : "" }}
                      </div>
                      <div
                        class="col-md-1"
                        style="padding: 0; text-align: right"
                      >
                        X
                      </div>
                    </div>
                    <div class="col-md-12" style="padding: 0">
                      <input
                        type="text"
                        name="custom_fields[index]"
                        v-model="statusform.custom_fields[index].value"
                        class="form-control"
                        style="border-radius: 2px; margin-top: 5px"
                        autocomplete="off"
                        :class="{
                          'is-invalid': statusform.errors.has(
                            'custom_fields[index]'
                          ),
                        }"
                      />
                    </div>
                  </div>

                  <div
                    style="
                      border: 1px solid #ccc;
                      text-align: center;
                      padding: 10px;
                      cursor: pointer;
                    "
                  >
                    <i
                      class="fa fa-plus"
                      aria-hidden="true"
                      style="color: #ccc"
                    ></i>
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
                    Post Status
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

.dropdown-menu {
  transform: translate3d(-30 px, 22 px, 0 px);
  left: -25px !important;
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
export default {
  components: {},
  props: ["id", "teamid"],
  data() {
    return {
      user: {},
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
      teamData: {},
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
      if (this.teamid == 0) {
        axios
          .get("/api/teams/list", {
            params: {
              unit_id: this.id ? this.id : 0,
            },
          })
          .then(({ data }) => {
            this.teams = data.data.teams;
            this.unitData = data.data.unitData;

            // Object.keys(this.teams.data).map((val, key) => {
            //   console.log(val);
            // });
          });
      } else {
        axios
          .get("/api/goals/list", {
            params: {
              team_id: this.teamid ? this.teamid : 0,
              unit_id: this.id ? this.id : 0,
            },
          })
          .then(({ data }) => {
            this.unitData = data.data.unitData;
            this.teamData = data.data.teamData;
            this.teams = data.data.goals;
            this.teams.data.map((val, key) => {
              this.isOpen[val.id] = false;
            });
          });
      }
    },
    newModal() {
      this.editmode = false;
      this.form.reset();
      $("#addNewTeam").modal("show");
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
      $("#addnewfield1").modal("show");
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
