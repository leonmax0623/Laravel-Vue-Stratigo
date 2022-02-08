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
              <span>+ </span>Add Goal
            </button>
          </div>
          <div>
            <a href="#" class="mr-3"
              ><i class="mdi mdi-progress-check"></i> All Goals</a
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
          style="
            display: flex;
            align-items: flex-start;
            border-top: 1px solid #dee2e6;
          "
        >
          <!-- <Table /> -->
          <table class="table table-hover">
            <thead>
              <tr>
                <th colspan="2" class="border-right" width="45%">Goal name</th>
                <th class="border-right" width="40%">Objectives</th>
                <th class="border-right" width="10%">Assignee</th>
                <th><i class="fa fa-plus" aria-hidden="true"></i></th>
              </tr>
            </thead>
            <tbody v-for="team in teams.data" :key="team.id">
              <tr>
                <td
                  colspan="2"
                  class="border-right tablehead h5 font-weight-bold teamtdtitle"
                  @click="toggleContainer(team)"
                  v-if="!teamid"
                >
                  <v-btn
                    @click="toggle(team)"
                    small
                    icon
                    :data-open="isOpen[team.id]"
                    v-if="!teamid"
                  >
                    <v-icon v-if="isOpen[team.id]">mdi-chevron-down </v-icon>
                    <v-icon v-else>mdi-chevron-right</v-icon>
                  </v-btn>
                  <i
                    v-if="!teamid"
                    class="fa fa-users to"
                    aria-hidden="true"
                    id="navbarSideButton"
                    style="color: #8dc6ff; margin-right: 10px"
                  ></i>
                  <img v-if="teamid" style="" src="../../img/goals.png" />
                  <a v-if="!teamid" style="color: #613629; cursor: pointer">
                    {{ team.name }}
                  </a>
                  <a v-if="teamid" style="color: #613629; cursor: pointer">
                    {{ team.goal_name }}
                  </a>
                </td>
                <td
                  colspan="2"
                  class="border-right tablehead h5 font-weight-bold teamtdtitle"
                  @click="togglegoal(team)"
                  v-else
                >
                  <v-btn
                    @click="toggle(team)"
                    small
                    icon
                    :data-open="isOpen[team.id]"
                    v-if="!teamid"
                  >
                    <v-icon v-if="isOpen[team.id]">mdi-chevron-down </v-icon>
                    <v-icon v-else>mdi-chevron-right</v-icon>
                  </v-btn>
                  <i
                    v-if="!teamid"
                    class="fa fa-users to"
                    aria-hidden="true"
                    id="navbarSideButton"
                    style="color: #8dc6ff; margin-right: 10px"
                  ></i>
                  <img v-if="teamid" style="" src="../../img/goals.png" />
                  <a v-if="!teamid" style="color: #613629; cursor: pointer">
                    {{ team.name }}
                  </a>
                  <a v-if="teamid" style="color: #613629; cursor: pointer">
                    {{ team.goal_name }}
                  </a>
                </td>
                <td style="text-align: center">
                  {{ team.collaborator }}
                </td>
                <td style="text-align: center">
                  <span class="badge badge-primary badge-pill">
                    {{ team.user.name | short_hand }}
                  </span>
                  {{ team.user.name }}
                </td>
                <td></td>
              </tr>
              <tr
                v-if="isOpen[team.id]"
                v-for="goal in team.goals"
                :key="goal.id"
              >
                <td width="5%"></td>
                <td class="border-right" @click="togglegoal(goal)">
                  <img style="" src="../../img/goals.png" />
                  {{ goal.goal_name }}
                </td>
                <td style="text-align: center">
                  {{ goal.objectives }}
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
            :data="teams"
            @pagination-change-page="getResults"
          ></pagination>
        </div>
        <div id="profilegoal" class="side-options-overlay overlay collapse">
          <div class="card card-outline-secondary h-100 border-0">
            <form
              autocomplete="off"
              id="myForm"
              class="form"
              role="form"
              @submit.prevent="submitTeamEdit()"
            >
              <input type="hidden" id="team_id" :value="teamData.id" />
              <input type="hidden" id="team_name" :value="teamData.name" />
              <div class="card-header d-flex justify-content-between">
                <div style="width: 87%">
                  <h4 class="d-inline-block">
                    <i class="fa fa-users to" aria-hidden="true"></i>
                    {{ goalData.goal_name }}
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
                      <a class="dropdown-item" href="#" @click="submitGoalEdit"
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
                    @click="togglegoalBack()"
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
                  <!-- <span class="badge badge-primary badge-pill">
                    {{ user_name | short_hand }}
                  </span> -->
                  <span>{{ user_name }}</span>
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
                      v-model="goalData.description"
                    ></textarea>
                  </div>
                </div>

                <div class="form-group" style="margin-bottom: 0px">
                  <label class="col-lg-12 col-form-label form-control-label"
                    >Objectives <span class="questionBadge">?</span></label
                  >
                  <Objectives :goalData="goalData" />
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
        <div
          class="side-options-overlay overlay collapse"
          id="profilelist_team"
        >
          <div class="card card-outline-secondary h-100 border-0">
            <form
              autocomplete="off"
              id="myForm"
              class="form"
              role="form"
              @submit.prevent="submitTeamEdit()"
            >
              <input type="hidden" id="team_id" :value="teamData.id" />
              <input type="hidden" id="team_name" :value="teamData.name" />
              <div class="card-header d-flex justify-content-between">
                <div style="width: 87%">
                  <h4 class="d-inline-block">
                    <i class="fa fa-users to" aria-hidden="true"></i>
                    {{ teamData.name }}
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
                      <a class="dropdown-item" href="#" @click="submitGoalEdit"
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
                    @click="toggleContainerBack()"
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
                  <!-- <span class="badge badge-primary badge-pill">
                    {{ user_name | short_hand }}
                  </span> -->
                  <span>{{ user_name }}</span>
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
                  <label class="col-lg-12 col-form-label form-control-label"
                    >Planners <span class="questionBadge">?</span></label
                  >
                </div>
                <div class="form-group" style="margin-bottom: 0px">
                  <div class=""></div>
                  <div
                    class=""
                    v-for="(planner, i) in teamData.planner"
                    :key="i"
                  >
                    <!-- { if(planner_team.unit_id==team.unit_id && planner_team.name==team.name)} -->
                    <span class="badge badge-primary badge-pill">{{
                      planner.user.name | short_hand
                    }}</span>
                    <span>{{ planner.user.name }}</span>
                  </div>
                </div>

                <div class="form-group" style="margin-bottom: 0px">
                  <label class="col-lg-12 col-form-label form-control-label"
                    >Collaborators <span class="questionBadge">?</span></label
                  >
                </div>
                <div class="form-group" style="margin-bottom: 0px">
                  <div class=""></div>
                  <div
                    class=""
                    v-for="(colleborator, i) in teamData.colleborator"
                    :key="i"
                  >
                    <span class="badge badge-primary badge-pill">{{
                      colleborator && colleborator.user.name | short_hand
                    }}</span>
                    <span>{{ colleborator && colleborator.user.name }}</span>
                  </div>
                </div>
                <div class="form-group" style="margin-bottom: 0px">
                  <label class="col-lg-12 col-form-label form-control-label"
                    >Goals <span class="questionBadge">?</span></label
                  >
                </div>
                <div class="form-group" style="margin-bottom: 0px">
                  <div
                    v-for="goal in teamData.goals"
                    :key="goal.id"
                    style="
                      border-bottom: 1px solid #cdcdcd;
                      width: 95%;
                      padding-left: 6px;
                      margin-left: 18px;
                      font-size: 16px;
                      display: flex;
                    "
                  >
                    <div style="width: 90%">
                      <img style="" src="../../img/goals.png" />
                      <span>{{ goal.goal_name }}</span>
                    </div>
                    <span
                      class="badge badge-primary badge-pill"
                      style="margin: 6px"
                    >
                      {{ teamData.user.name | short_hand }}
                    </span>
                  </div>
                  <a href="#" style="font-size: 12px; padding-left: 35px"
                    >+Add goal</a
                  >
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
      id="addNewGoal"
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
              Add Goal
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

          <form id="addNewTeamForm" @submit.prevent="createGoal()">
            <div class="modal-body" style="padding-top: 0">
              <div class="form-group">
                <label style="font: normal normal 490 11px Montserrat"
                  >Name of the team:</label
                >
                <select
                  id="name"
                  v-model="form.name"
                  data-show-content="true"
                  class="form-control"
                >
                  <option v-for="team in teams.data" :key="team.id">
                    {{ team.name }}
                  </option>
                </select>
                <has-error :form="form" field="name"></has-error>
                <label style="font: normal normal 490 11px Montserrat"
                  >Name of the goal:</label
                >
                <input
                  type="text"
                  name="goal_name"
                  v-model="form.goal_name"
                  class="form-control"
                  style="border-radius: 2px; margin-top: 5px"
                  autocomplete="off"
                  :class="{ 'is-invalid': form.errors.has('name') }"
                />
                <has-error :form="form" field="goal_name"></has-error>
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

<style>
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

.dropdown-menu {
  transform: translate3d(-30 px, 22 px, 0 px);
  left: -25px !important;
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
</style>

<script>
import Objectives from "./Objectives.vue";
export default {
  components: {
    Objectives: Objectives,
  },
  props: {
    id: Number,
    teamid: Number,
  },
  data() {
    return {
      isOpen: [],
      visible: true,
      teams: {},
      goals: {},
      teamData: {},
      goalData: {},
      teamform: new Form({
        name: "",
        team_id: 0,
        unit_id: 0,
        description: "",
        planner: "",
        collaborator: "",
      }),
      tmp: 0,
      team_name: "",
      user_name: "",
      unitData: {},
      form: new Form({
        id: "",
        unit_id: "",
        name: "",
        goal_name: "",
      }),
    };
  },
  methods: {
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
    createGoal() {
      this.$Progress.start();
      this.form.unit_id = this.id;
      this.form
        .post("/api/goals/store")
        .then((data) => {
          $("#addNewGoal").modal("hide");

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
    customize() {
      this.visible = !this.visible;
    },
    toggleContainerBack() {
      $("#profilelist_team").removeClass("show");
    },
    togglegoalBack() {
      $("#profilegoal").removeClass("show");
    },
    toggleContainer(team) {
      this.teamData = team;
      console.log("teamdata", team);
      this.loadname(this.goalData);
      $("#profilegoal").removeClass("show");
      $("#profilelist_team").addClass("show");
      if (team.id == this.tmp) {
        $("#profilelist_team").removeClass("show");
        this.tmp = 0;
      } else this.tmp = team.id;
    },
    togglegoal(goal) {
      $("#profilelist_team").removeClass("show");
      this.goalData = goal;
      this.loadname(this.goalData);
      console.log("goaldata", this.goalData);
      $("#profilegoal").addClass("show");
      if (goal.id == this.tmp) {
        $("#profilegoal").removeClass("show");
        this.tmp = 0;
      } else this.tmp = goal.id;
    },
    loadname(data) {
      axios
        .get("/api/goals/getteamname", {
          params: {
            team_id: data.team_id,
            user_id: data.user_id,
          },
        })
        .then(({ data }) => {
          this.user_name = data.data.username.name;
        });
    },
    add_field() {
      $("#addfield").modal("show");
    },
    newModal() {
      this.form.reset();
      $("#addNewGoal").modal("show");
    },
    submitGoalEdit() {
      this.$Progress.start();
      this.teamform.name = this.teamData.name;
      this.teamform.unit_id = this.id;
      this.teamform.description = $("#complexExampleMessage").val();
      this.teamform.collaborator = this.collaborator_value;
      this.teamform.planner = this.planner_value;
      this.teamform.team_id = team_id;
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

            this.teams.data.map((val, key) => {
              this.isOpen[val.id] = true;
            });
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
            this.teams = data.data.goals;
            // this.teams.data.map((val, key) => {
            //   this.isOpen[val.id] = false;
            // });
          });
      }
    },
    loadGoals() {
      axios
        .get("/api/goals/list", {
          params: {
            unit_id: this.id ? this.id : 0,
          },
        })
        .then(({ data }) => {
          this.goals = data.data.goals;
          this.unitData = data.data.unitData;
        });
    },
    toggle(team) {
      this.toggleContainer(team);
      this.isOpen[team.id] = !this.isOpen[team.id];
      this.$forceUpdate();
    },
    duplicateModal() {
      $("#duplicateModal").modal("show");
    },
  },
  watch: {
    id(newValue) {
      this.loadTeams();
    },
    teamid(newValue) {
      this.loadTeams();
    },
  },
  created() {
    this.$Progress.start();
    this.$Progress.finish();
  },
  filters: {
    short_hand(company_name) {
      var matches = company_name.match(/\b(\w)/g);
      var acronym = matches.join("");
      return acronym.toUpperCase(); // <-- The return value as Per logic
    },
  },
};
</script>