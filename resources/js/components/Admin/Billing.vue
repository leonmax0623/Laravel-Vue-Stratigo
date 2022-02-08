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
        width="25px"
        height="20px"
        viewBox="0 0 20.364 14"
        style="margin-bottom: 7px; margin-left: 28px"
      >
        <path
          d="M18.136,80H2.227A2.23,2.23,0,0,0,0,82.227v9.545A2.23,2.23,0,0,0,2.227,94H18.136a2.23,2.23,0,0,0,2.227-2.227V82.227A2.23,2.23,0,0,0,18.136,80ZM2.227,81.273H18.136a.956.956,0,0,1,.955.955V83.5H1.273V82.227A.956.956,0,0,1,2.227,81.273ZM18.136,92.727H2.227a.956.956,0,0,1-.955-.955v-7H19.091v7A.956.956,0,0,1,18.136,92.727Z"
          transform="translate(0 -80)"
        />
        <path
          d="M81.273,305.909h-.636a.636.636,0,0,1-.636-.636v-.636a.636.636,0,0,1,.636-.636h.636a.636.636,0,0,1,.636.636v.636A.636.636,0,0,1,81.273,305.909Z"
          transform="translate(-76.818 -295.091)"
        />
      </svg>
      <span
        style="font-family: 'Montserrat'; font-size: 22px; font-weight: bolder"
        >Billing</span
      >
      <v-row style="margin-top: 30px">
        <v-col class="col-6" style="margin-top: -11px">
          <img src="../../img/log.png" />
          <span class="subtitle">Plan Details</span>
          <v-card
            class="overflow-hidden mx-auto pa-2"
            height="200"
            max-width="650"
          >
            <div class="row">
              <div class="col-3 mine">
                <span class="name">Current plan</span><br />
                <span class="detail">Scale Up</span>
              </div>
              <div class="col-3 mine">
                <span class="name">Seats</span><br />
                <span class="detail">30</span>
              </div>
              <div class="col-3 mine">
                <span class="name">Period</span><br />
                <span class="detail">Monthly</span>
              </div>
              <div class="col-3 mine">
                <span class="name">Renewal</span><br />
                <span class="detail">$36</span><br />
                <span class="name">Jan 8, 2022</span>
              </div>
            </div>
            <v-bottom-navigation absolute>
              <v-btn
                color="deep-purple accent-4"
                text
                @click="dialog_edit_plan = true"
              >
                <span class="my_btn">Edit plan</span>
              </v-btn>

              <v-btn
                color="deep-purple accent-4"
                text
                @click="dialog_close_account = true"
              >
                <span class="my_btn">Close my account</span>
              </v-btn>
            </v-bottom-navigation>
          </v-card>
        </v-col>
        <v-col class="col-6">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="25.681"
            height="25.681"
            viewBox="0 0 25.681 25.681"
          >
            <g transform="translate(0)">
              <g transform="translate(0)">
                <g transform="translate(0)">
                  <path
                    d="M18.437,12.886a13.051,13.051,0,0,0-1.509-.606,6.822,6.822,0,1,0-8.168,0A13.048,13.048,0,0,0,.065,22.006a3.048,3.048,0,0,0,2.979,3.675H15.4a1,1,0,1,0,0-2.006H3.045a1.019,1.019,0,0,1-.8-.382,1.048,1.048,0,0,1-.212-.879,11.084,11.084,0,0,1,10.545-8.777q.132.005.266.005t.269-.005a10.927,10.927,0,0,1,4.466,1.06,1,1,0,0,0,.861-1.812Zm-5.352-1.256-.245,0-.243,0a4.815,4.815,0,1,1,.487,0Z"
                    transform="translate(0)"
                  />
                </g>
              </g>
              <g transform="translate(16.151 16.151)">
                <path
                  d="M330.527,325.762h-2.759V323a1,1,0,1,0-2.006,0v2.759H323a1,1,0,1,0,0,2.006h2.759v2.759a1,1,0,1,0,2.006,0v-2.759h2.759a1,1,0,1,0,0-2.006Z"
                  transform="translate(-322 -322)"
                />
              </g>
            </g>
          </svg>
          <span class="subtitle">Current Users</span>
          <v-card
            class="overflow-hidden mx-auto pa-2"
            height="200"
            max-width="650"
          >
            <div class="row">
              <div class="col-4 mine">
                <span class="name">Members</span><br />
                <span class="detail">25 members</span>
              </div>
              <div class="col-4 mine">
                <span class="name">Viewers</span><br />
                <span class="detail">8 viewers</span>
              </div>
              <div class="col-4 mine">
                <span class="name">Allocated seats</span><br />
                <span class="detail">25/30 seats</span>
              </div>
            </div>
            <v-bottom-navigation absolute>
              <v-btn
                color="deep-purple accent-4"
                text
                @click="dialog_add_seats = true"
              >
                <span class="my_btn">Add seats</span>
              </v-btn>

              <v-btn
                color="deep-purple accent-4"
                text
                @click="dialog_remove_seats = true"
              >
                <span class="my_btn">Remove seats</span>
              </v-btn>
            </v-bottom-navigation>
          </v-card>
        </v-col>
      </v-row>
      <v-row style="margin-top: 15px">
        <v-col class="col-6">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="26px"
            height="26px"
            viewBox="0 0 20.364 14"
            style="margin-bottom: 5px"
          >
            <path
              d="M18.136,80H2.227A2.23,2.23,0,0,0,0,82.227v9.545A2.23,2.23,0,0,0,2.227,94H18.136a2.23,2.23,0,0,0,2.227-2.227V82.227A2.23,2.23,0,0,0,18.136,80ZM2.227,81.273H18.136a.956.956,0,0,1,.955.955V83.5H1.273V82.227A.956.956,0,0,1,2.227,81.273ZM18.136,92.727H2.227a.956.956,0,0,1-.955-.955v-7H19.091v7A.956.956,0,0,1,18.136,92.727Z"
              transform="translate(0 -80)"
            />
            <path
              d="M81.273,305.909h-.636a.636.636,0,0,1-.636-.636v-.636a.636.636,0,0,1,.636-.636h.636a.636.636,0,0,1,.636.636v.636A.636.636,0,0,1,81.273,305.909Z"
              transform="translate(-76.818 -295.091)"
            />
          </svg>
          <span class="subtitle">Payment Info</span>
          <v-card
            class="overflow-hidden mx-auto pa-2"
            height="200"
            max-width="650"
          >
            <div class="row">
              <div class="col-12">
                <span class="name">Card info</span><br />
                <span class="detail">Visa ending in 1234</span>
              </div>
            </div>
            <v-bottom-navigation absolute>
              <v-btn
                color="deep-purple accent-4"
                text
                @click="dialog_edit_payment_info = true"
              >
                <span class="my_btn">Edit payment info</span>
              </v-btn>
            </v-bottom-navigation>
          </v-card>
        </v-col>
        <v-col class="col-6">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="26.387"
            height="26.387"
            viewBox="0 0 26.387 26.387"
          >
            <g transform="translate(0)">
              <g transform="translate(0)">
                <path
                  d="M26.32,22.61a1.031,1.031,0,0,0-2.018.42,1.077,1.077,0,0,1-.218.9,1.047,1.047,0,0,1-.825.392H3.128a1.047,1.047,0,0,1-.825-.392,1.077,1.077,0,0,1-.218-.9,11.388,11.388,0,0,1,10.835-9.018q.136.005.273.005t.274-.005a11.339,11.339,0,0,1,9.157,5.033A1.031,1.031,0,1,0,24.338,17.9,13.407,13.407,0,0,0,17.39,12.62a7.009,7.009,0,1,0-8.39,0A13.406,13.406,0,0,0,.067,22.61a3.131,3.131,0,0,0,3.061,3.777H23.259A3.132,3.132,0,0,0,26.32,22.61ZM8.246,7.009a4.948,4.948,0,1,1,5.2,4.941l-.25,0-.249,0A4.954,4.954,0,0,1,8.246,7.009Z"
                  transform="translate(0)"
                />
              </g>
            </g>
          </svg>
          <span class="subtitle">Billing Contact</span>
          <v-card
            class="overflow-hidden mx-auto pa-2"
            height="200"
            max-width="650"
          >
            <div class="row">
              <div class="col-12">
                <span class="name" style="margin-bottom: 10px">Member</span
                ><br />
                <div
                  style="
                    margin-top: 10px;
                    font-family: 'Montserrat';
                    font-weight: bolder;
                    font-size: 20px;
                  "
                >
                  <v-avatar
                    :color="getColor(billing_contactor)"
                    style="
                      font-size: 16px;
                      margin-right: 10px;
                      margin-top: -1px;
                      color: white;
                    "
                    size="36"
                  >
                    {{ billing_contactor.slice(0, 2) }}
                  </v-avatar>
                  {{ billing_contactor }}
                </div>
              </div>
            </div>
            <v-expand-transition>
              <v-card
                v-if="reveal"
                class="transition-fast-in-fast-out v-card--reveal"
                style="height: 100%"
              >
                <v-card-text class="pb-0">
                  <v-row style="align-items: center">
                    <v-col
                      class="d-flex"
                      cols="12"
                      sm="5"
                      style="margin-top: -20px; height: 35px"
                    >
                      <v-autocomplete
                        v-model="name_value"
                        :items="user_names"
                        dense
                        filled
                        label="Enter name"
                        @change="select_billing_contact('name')"
                      ></v-autocomplete>
                    </v-col>

                    <v-col
                      class="d-flex"
                      cols="12"
                      sm="7"
                      style="margin-top: -20px; height: 35px"
                    >
                      <v-autocomplete
                        v-model="email_value"
                        :items="user_emails"
                        dense
                        filled
                        label="Or Email"
                        @change="select_billing_contact('email')"
                      ></v-autocomplete>
                    </v-col>
                    <div class="pull-right" style="margin-left: 62%">
                      <v-btn
                        class="ma-2"
                        :loading="loading2"
                        :disabled="loading2"
                        color="success"
                        @click="change_billing_contactor"
                        style="margin-top: 45px !important; margin-left: 30%"
                      >
                        change
                        <template v-slot:loader>
                          <span style="font-size: 12px !important"
                            >Saving...</span
                          >
                        </template>
                      </v-btn>
                      <v-btn
                        depressed
                        color="error"
                        text
                        @click="reveal = false"
                        style="margin-top: 40px !important"
                      >
                        Cancel
                      </v-btn>
                    </div>
                  </v-row>
                </v-card-text>
              </v-card>
            </v-expand-transition>
            <v-bottom-navigation absolute>
              <v-btn color="deep-purple accent-4" text>
                <span class="my_btn" @click="reveal = true"
                  >Change billing contact</span
                >
              </v-btn>
            </v-bottom-navigation>
          </v-card>
        </v-col>
      </v-row>
      <v-row style="margin-top: 15px">
        <v-col class="col-6" style="margin-top: 6px">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="18.438"
            height="24.585"
            viewBox="0 0 18.438 24.585"
          >
            <g transform="translate(-64)">
              <g transform="translate(64)">
                <g transform="translate(0)">
                  <path
                    d="M82.288,5.272,77.167.15A.512.512,0,0,0,76.8,0H66.049A2.051,2.051,0,0,0,64,2.049V22.536a2.051,2.051,0,0,0,2.049,2.049H80.39a2.051,2.051,0,0,0,2.049-2.049V5.634A.512.512,0,0,0,82.288,5.272ZM77.317,1.749,80.69,5.122H78.341A1.025,1.025,0,0,1,77.317,4.1Zm4.1,20.787A1.025,1.025,0,0,1,80.39,23.56H66.049a1.025,1.025,0,0,1-1.024-1.024V2.049a1.025,1.025,0,0,1,1.024-1.024H76.292V4.1a2.051,2.051,0,0,0,2.049,2.049h3.073Z"
                    transform="translate(-64)"
                  />
                  <path
                    d="M139.78,298.667H128.512a.512.512,0,0,0,0,1.024H139.78a.512.512,0,1,0,0-1.024Z"
                    transform="translate(-124.927 -284.326)"
                  />
                  <path
                    d="M139.78,234.667H128.512a.512.512,0,0,0,0,1.024H139.78a.512.512,0,1,0,0-1.024Z"
                    transform="translate(-124.927 -223.399)"
                  />
                  <path
                    d="M139.78,362.667H128.512a.512.512,0,0,0,0,1.024H139.78a.512.512,0,1,0,0-1.024Z"
                    transform="translate(-124.927 -345.253)"
                  />
                  <path
                    d="M134.658,426.667h-6.146a.512.512,0,0,0,0,1.024h6.146a.512.512,0,0,0,0-1.024Z"
                    transform="translate(-124.927 -406.18)"
                  />
                  <path
                    d="M234.667,171.178a.512.512,0,0,0,.512.512h6.146a.512.512,0,1,0,0-1.024h-6.146A.512.512,0,0,0,234.667,171.178Z"
                    transform="translate(-226.472 -162.471)"
                  />
                  <path
                    d="M129.537,79.275h-1.024a.512.512,0,0,0,0,1.024h.512a.512.512,0,0,0,1.024,0V80.2a1.533,1.533,0,0,0-.512-2.979.512.512,0,0,1,0-1.024h1.024a.512.512,0,1,0,0-1.024h-.512a.512.512,0,1,0-1.024,0v.094a1.533,1.533,0,0,0,.512,2.979.512.512,0,1,1,0,1.024Z"
                    transform="translate(-124.927 -71.08)"
                  />
                </g>
              </g>
            </g>
          </svg>
          <span class="subtitle">Latest Invoice</span>
          <v-card
            class="overflow-hidden mx-auto pa-2"
            height="200"
            max-width="650"
          >
            <div class="row">
              <div class="col-3 mine">
                <span class="name">Current plan</span><br />
                <span class="detail">Scale Up</span>
              </div>
              <div class="col-3 mine">
                <span class="name">Seats</span><br />
                <span class="detail">30</span>
              </div>
              <div class="col-6 mine">
                <span class="name">Period</span><br />
                <span class="detail">Dec 8, 2021 - Jan 7, 2022</span>
              </div>
            </div>
            <v-bottom-navigation absolute>
              <v-btn color="deep-purple accent-4" text>
                <a
                  style="
                    font-family: 'Montserrat';
                    font-size: 16px;
                    font-weight: bold;
                    letter-spacing: 0;
                    margin-bottom: 5 px;
                  "
                  href="https://github.com/twbs/bootstrap/archive/v4.0.0.zip"
                  download
                  >Download</a
                >
              </v-btn>
            </v-bottom-navigation>
          </v-card>
        </v-col>
        <v-col class="col-6">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="27.771"
            height="30.91"
            viewBox="0 0 27.771 30.91"
          >
            <g transform="translate(-26)">
              <g transform="translate(45.923 23.907)">
                <path
                  d="M356.6,396a.6.6,0,1,0,.6.6A.6.6,0,0,0,356.6,396Z"
                  transform="translate(-356 -396)"
                />
              </g>
              <g transform="translate(26)">
                <g transform="translate(0)">
                  <path
                    d="M48.013,21.955,45.143,21l-1.03-2.06a6.612,6.612,0,0,0,1.79-3.5l.128-.77h1.1a1.813,1.813,0,0,0,1.811-1.811v-3.8a9.056,9.056,0,0,0-18.111,0v3.8a1.814,1.814,0,0,0,1.207,1.707v.708a1.813,1.813,0,0,0,1.811,1.811h.53a6.55,6.55,0,0,0,1.013,1.568c.085.1.175.194.266.286L34.628,21l-2.87.956A8.9,8.9,0,0,0,26,30.306a.6.6,0,0,0,.6.6H53.167a.6.6,0,0,0,.6-.6A8.9,8.9,0,0,0,48.013,21.955Zm-.279-9.1a.6.6,0,0,1-.6.6h-.921c.153-1.189.256-2.454.3-3.7,0-.035,0-.069,0-.1h1.225Zm-15.093.6a.6.6,0,0,1-.6-.6v-3.2h1.225q0,.094.006.19v.006h0c.042,1.212.143,2.444.293,3.606h-.922Zm1.207,2.415a.6.6,0,0,1-.6-.6v-.6h.495l.128.77c.025.146.055.292.089.437Zm-.6-7.426H32.06a7.849,7.849,0,0,1,15.651,0H46.525a6.115,6.115,0,0,0-6.1-6.037H39.345A6.115,6.115,0,0,0,33.246,8.452Zm6.1-4.83h1.081a4.909,4.909,0,0,1,4.893,4.915c0,.19,0,.355,0,.506,0,0,0,0,0,.006l-.755-.108A9.7,9.7,0,0,1,39.1,6.214a.6.6,0,0,0-.427-.177,5.462,5.462,0,0,0-4.2,1.987A4.908,4.908,0,0,1,39.345,3.622ZM35.209,15.878a34.508,34.508,0,0,1-.724-5.859L35.3,8.935a4.249,4.249,0,0,1,3.142-1.684,10.92,10.92,0,0,0,5.949,2.885l.889.127c-.059,1.261-.181,2.526-.355,3.69h0c-.055.374-.1.615-.21,1.287a5.128,5.128,0,0,1-3.64,4.124,4.75,4.75,0,0,1-5.332-2.281h1.231a1.814,1.814,0,0,0,1.707,1.207h1.207a1.811,1.811,0,1,0,0-3.622H38.678a1.812,1.812,0,0,0-1.708,1.207Zm3.418,4.71a6.055,6.055,0,0,0,2.245.051l-1.067,1.128Zm.349,2.056-1.915,2.025a23,23,0,0,1-1.352-3.134l.719-1.438Zm4.264-2.752.821,1.643a23,23,0,0,1-1.352,3.135L40.66,22.62Zm-5.166-3.411a.6.6,0,0,1,.6-.6h1.207a.6.6,0,0,1,0,1.207H38.678A.6.6,0,0,1,38.074,16.481ZM27.232,29.7a7.63,7.63,0,0,1,4.908-6.6l2.541-.847A24.2,24.2,0,0,0,36.4,25.981l0,.006h0a24.208,24.208,0,0,0,1.652,2.523L38.8,29.7Zm12.654-.538-.819-1.314q-.014-.022-.029-.043a23.02,23.02,0,0,1-1.36-2.032L39.83,23.5,42.1,25.767a22.993,22.993,0,0,1-1.365,2.04C40.7,27.846,40.746,27.784,39.885,29.165Zm1.087.538.743-1.192a24.2,24.2,0,0,0,1.664-2.544l.009-.016v0a24.182,24.182,0,0,0,1.7-3.7l2.541.847a7.629,7.629,0,0,1,4.908,6.6H40.973Z"
                    transform="translate(-26)"
                  />
                </g>
              </g>
              <g transform="translate(48.044 25.059)">
                <path
                  d="M393.82,417.289a6.036,6.036,0,0,0-1.709-2.075.6.6,0,0,0-.736.957,4.821,4.821,0,0,1,1.365,1.657.6.6,0,0,0,1.08-.54Z"
                  transform="translate(-391.139 -415.088)"
                />
              </g>
            </g>
          </svg>
          <span class="subtitle">Contact Support</span>
          <v-card
            class="overflow-hidden mx-auto pa-2"
            height="200"
            max-width="650"
          >
            <div class="row">
              <div class="col-12">
                <span class="detail"
                  >Our support team is here to help with any questions you may
                  have</span
                >
              </div>
            </div>
            <v-bottom-navigation absolute>
              <v-btn
                color="deep-purple accent-4"
                text
                @click="dialog_contact_support = true"
              >
                <span class="my_btn">Contact support</span>
              </v-btn>
              <v-btn color="deep-purple accent-4" text>
                <router-link to="/rescources">
                  <span class="my_btn">Rescources</span>
                </router-link>
              </v-btn>
            </v-bottom-navigation>
          </v-card>
        </v-col>
      </v-row>
    </div>
    <!-- Modals -->
    <!-- Adding seats -->

    <v-dialog
      v-model="dialog_add_seats"
      transition="dialog-top-transition"
      max-width="600"
    >
      <div class="modal-content">
        <div class="modal-header" style="padding: 30px 30px 15px 30px">
          <h5
            class="modal-title"
            style="
              display: inline-block;
              font-family: 'Montserrat';
              font-size: 20px;
              font-weight: bold;
            "
          >
            Add seats
          </h5>
          <button type="button" class="close" @click="dialog_add_seats = false">
            <span aria-hidden="true" style="font-size: 32px">&times;</span>
          </button>
        </div>

        <form id="add_seats" @submit.prevent="store()">
          <div class="modal-body" style="padding: 2rem">
            <div class="form-group" style="margin-top: 10px">
              <span>You are currently using 25 seats in your 30 seat plan</span>
              <div>
                <v-row style="margin-top: 15px">
                  <v-col class="col-6">
                    <span
                      style="font-size: 14px; font-weight: bolder; color: grey"
                      >Current plan</span
                    >
                    <v-select
                      :items="items"
                      label="25 seats"
                      dense
                      outlined
                      disabled
                    ></v-select>
                  </v-col>
                  <v-col class="col-6">
                    <span
                      style="font-size: 14px; font-weight: bolder; color: grey"
                      >Your new plan</span
                    >
                    <v-select
                      :items="items"
                      label="30 seats"
                      dense
                      outlined
                    ></v-select>
                  </v-col>
                </v-row>
              </div>
              <span style="font: normal normal 490 15px Montserrat">
                For your current billing cycle, you'll be charged $55 USD
                (Prorated). When your plan renews on Jan 8, 2021, your new
                monthly total will be $350, unless you cancel then. These prices
                do not include applicable taxes or discounts. All changes are
                subject to our subscriber terms. </span
              ><br />
              <div style="margin-top: 13px">
                <span>Payment details</span><br />
                <img style="margin-left: 0px" src="../../img/visa.png" />
                <span style="font-size: 15px; font-weight: bolder"
                  >Visa ending in 1234</span
                >
                <button
                  type="submit"
                  class="submit btn btn-primary"
                  style="
                    font: normal normal 600 15px Montserrat;
                    padding: 8px 12px;
                    height: auto;
                    color: #0c95fe;
                    background-color: white;
                    border-color: white;
                  "
                >
                  Edit payment
                </button>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <a
              href="#"
              @click="dialog_add_seats = false"
              style="
                font: normal normal 490 16px Montserrat;
                letter-spacing: 0px;
                margin-right: 10px;
                text-decoration: none;
                color: grey;
                font-weight: bolder;
              "
              >Cancel</a
            >
            <button
              type="submit"
              class="submit btn btn-primary"
              style="
                font: normal normal 490 16px Montserrat;
                padding: 8px 12px;
                height: auto;
                background-color: #3499ff;
                border-color: #3499ff;
              "
            >
              Add seats
            </button>
          </div>
        </form>
      </div>
    </v-dialog>

    <!-- Removing Seats -->
    <v-dialog
      v-model="dialog_remove_seats"
      transition="dialog-top-transition"
      max-width="600"
    >
      <div class="modal-content">
        <div class="modal-header" style="padding: 30px 30px 15px 30px">
          <h5
            class="modal-title"
            style="
              display: inline-block;
              font-family: 'Montserrat';
              font-size: 20px;
              font-weight: bold;
            "
          >
            Remove seats
          </h5>
          <button
            type="button"
            class="close"
            @click="dialog_remove_seats = false"
          >
            <span aria-hidden="true" style="font-size: 32px">&times;</span>
          </button>
        </div>

        <form id="remove_seats" @submit.prevent="store()">
          <div class="modal-body" style="padding: 2rem">
            <div class="form-group" style="margin-top: 10px">
              <span>You are currently using 25 seats in your 30 seat plan</span>
              <div>
                <v-row style="margin-top: 15px">
                  <v-col class="col-12">
                    <span
                      style="font-size: 14px; font-weight: bolder; color: grey"
                      >Current plan</span
                    >
                    <v-select
                      :items="items"
                      label="25 seats"
                      dense
                      outlined
                      disabled
                    ></v-select>
                  </v-col>
                </v-row>
              </div>
              <div style="text-align: center">
                <span style="font: normal normal 490 22px Montserrat">
                  Are you sure to remove your seats? </span
                ><br />
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <a
              href="#"
              @click="dialog_remove_seats = false"
              style="
                font: normal normal 490 16px Montserrat;
                letter-spacing: 0px;
                margin-right: 10px;
                text-decoration: none;
                color: grey;
                font-weight: bolder;
              "
              >Cancel</a
            >
            <button
              type="submit"
              class="submit btn btn-primary"
              style="
                font: normal normal 490 16px Montserrat;
                padding: 8px 12px;
                height: auto;
                background-color: #3499ff;
                border-color: #3499ff;
              "
            >
              Remove seats
            </button>
          </div>
        </form>
      </div>
    </v-dialog>

    <!-- Editing Plan -->

    <v-dialog
      v-model="dialog_edit_plan"
      fullscreen
      hide-overlay
      transition="dialog-top-transition"
      scrollable
    >
      <v-card-text style="padding: 0px !important">
        <div class="modal-content">
          <div class="modal-header" style="padding: 0px !important">
            <v-toolbar flat dark color="primary">
              <v-spacer></v-spacer>
              <v-btn icon dark @click="dialog_edit_plan = false">
                <v-icon>mdi-close</v-icon>
              </v-btn>
            </v-toolbar>
          </div>

          <div
            class="modal-body"
            style="
              padding: 11rem;
              text-align: center;
              padding-top: 40px !important;
              padding-bottom: 0.5rem;
            "
          >
            <div class="form-group">
              <div>
                <span
                  class="modal-title"
                  style="
                    display: inline-block;
                    font-family: 'Montserrat';
                    font-size: 30px;
                    font-weight: bold;
                  "
                >
                  Choose the right plan for your team
                </span>
                <div
                  style="text-align: left !important; display: flex"
                  class="d-flex justify-content-between"
                >
                  <div class="pull-left">
                    <v-select
                      label="Select your team size"
                      v-model="selected"
                      :items="sizes"
                      item-text="name"
                      item-value="val"
                      outlined
                    />
                  </div>
                  <div class="pull-right" style="margin-top: 20px">
                    <span>Billing cycle: Monthly</span>
                    <div style="float: right; display: flex; margin-left: 10px">
                      <v-switch
                        v-model="pay_mode"
                        @change="currentDataItems"
                        style="margin-top: 0px; padding-top: 0px"
                      ></v-switch>
                      <span>Annual</span>
                    </div>
                  </div>
                </div>
              </div>
              <div>
                <div style="justify-content: space-around">
                  <v-radio-group row v-model="plan_type">
                    <v-radio
                      class="error_box"
                      color="error"
                      :value="1"
                    ></v-radio>
                    <v-radio
                      class="warning_box"
                      color="warning"
                      :value="2"
                    ></v-radio>
                    <v-radio
                      class="success_box"
                      color="success"
                      :value="3"
                    ></v-radio>
                    <v-radio class="info_box" color="info" :value="4"></v-radio>
                  </v-radio-group>
                </div>
                <div
                  style="
                    justify-content: space-around;
                    display: flex;
                    margin-top: 20px;
                  "
                >
                  <div class="card border-danger mb-3" style="max-width: 18rem">
                    <div class="card-header" style="font-family: Montserrat">
                      Individual
                    </div>
                    <div class="card-body">
                      <span class="card-title" style="font-size: 22px"
                        >Project</span
                      >
                      <br />
                      <div
                        style="
                          margin-top: 20px;
                          display: flex;
                          justify-content: center;
                        "
                      >
                        <span style="font-size: 38px">$0</span>
                        <div style="float: right">
                          <span style="font-size: 19px; margin-left: 11px"
                            >free</span
                          >
                        </div>
                      </div>
                      <br />
                      <span>Up to 2 seats</span><br />

                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="41.447"
                        height="42.476"
                        viewBox="0 0 41.447 42.476"
                        style="
                          margin-left: 0px;
                          margin-top: 37px;
                          margin-bottom: 37px;
                        "
                      >
                        <g transform="translate(-16.311)">
                          <g transform="translate(16.311)">
                            <path
                              d="M190.172,42.476H209.98a2.339,2.339,0,0,0,0-4.677H192.615a16.11,16.11,0,0,1,32,0h-3.98a2.339,2.339,0,0,0,0,4.677h6.423a2.31,2.31,0,0,0,2.282-2.339A21.271,21.271,0,0,0,216.4,20.459a11.892,11.892,0,0,0,3.72-8.671,11.506,11.506,0,1,0-23.005,0,11.891,11.891,0,0,0,3.72,8.671A21.271,21.271,0,0,0,187.89,40.137,2.311,2.311,0,0,0,190.172,42.476Zm11.5-30.687a6.941,6.941,0,1,1,13.878,0,6.941,6.941,0,1,1-13.878,0Z"
                              transform="translate(-187.89)"
                            />
                          </g>
                        </g>
                      </svg>
                      <p class="card-text">
                        Ideal for small teams 1 level of hierarchy of planners
                      </p>
                      <hr />
                      <div style="text-align: left">
                        <span style="text-decoration: underline"
                          >Project plan includes:</span
                        ><br />
                        <div style="text-align: left; margin-left: 20px">
                          <span>* Unlimited Teams</span><br />
                          <span>* Unlimited Goals</span><br />
                          <span>* 200+ template</span><br />
                          <span>* Over 20 column types</span><br />
                          <span>* Up to 2 team members</span><br />
                          <span>* iOS and Android apps</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div
                    class="card border-warning mb-3"
                    style="max-width: 18rem"
                  >
                    <div class="card-header">Standard</div>
                    <div class="card-body">
                      <span class="card-title" style="font-size: 22px"
                        >Start Up</span
                      >
                      <br />
                      <div
                        style="
                          margin-top: 20px;
                          display: flex;
                          justify-content: center;
                        "
                      >
                        <span style="font-size: 38px; padding-top: 11px"
                          >${{ Math.round(prices.startup) }}</span
                        >
                        <div style="float: right">
                          <span style="font-size: 19px; margin-left: 11px"
                            >USD / seat<br />/ month</span
                          >
                        </div>
                      </div>
                      <br />
                      <span
                        >Total ${{ Math.round(prices.startup * selected) }} /
                        month</span
                      ><br />

                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="77.789"
                        height="69.338"
                        viewBox="0 0 77.789 69.338"
                        style="
                          margin-left: 0px;
                          margin-top: 20px;
                          margin-bottom: 26px;
                        "
                      >
                        <path
                          d="M202.124,319.325a5.938,5.938,0,0,0,1.858-4.33,5.746,5.746,0,1,0-11.488,0,5.937,5.937,0,0,0,1.858,4.33,10.621,10.621,0,0,0-6.462,9.826,1.154,1.154,0,0,0,1.139,1.168h18.417a1.154,1.154,0,0,0,1.139-1.168A10.622,10.622,0,0,0,202.124,319.325ZM194.773,315a3.466,3.466,0,1,1,3.465,3.551A3.513,3.513,0,0,1,194.773,315Zm-4.524,12.988a8.044,8.044,0,0,1,15.978,0Z"
                          transform="translate(-159.344 -260.981)"
                        />
                        <path
                          d="M380.385,315a5.937,5.937,0,0,0,1.858,4.33,10.621,10.621,0,0,0-6.462,9.826,1.154,1.154,0,0,0,1.14,1.168h18.417a1.154,1.154,0,0,0,1.14-1.168,10.621,10.621,0,0,0-6.462-9.826,5.938,5.938,0,0,0,1.858-4.33,5.746,5.746,0,1,0-11.488,0Zm13.733,12.988H378.14a8.044,8.044,0,0,1,15.978,0ZM389.594,315a3.466,3.466,0,1,1-3.465-3.551A3.513,3.513,0,0,1,389.594,315Z"
                          transform="translate(-318.688 -260.981)"
                        />
                        <path
                          d="M14.234,319.325A5.938,5.938,0,0,0,16.092,315a5.823,5.823,0,0,0-5.744-5.886A5.823,5.823,0,0,0,4.6,315a5.937,5.937,0,0,0,1.858,4.33A10.622,10.622,0,0,0,0,329.151a1.154,1.154,0,0,0,1.139,1.168H19.557a1.154,1.154,0,0,0,1.139-1.168A10.621,10.621,0,0,0,14.234,319.325ZM6.883,315a3.466,3.466,0,1,1,3.465,3.551A3.513,3.513,0,0,1,6.883,315ZM2.359,327.983a8.149,8.149,0,0,1,7.989-7.1,8.149,8.149,0,0,1,7.989,7.1Z"
                          transform="translate(0 -260.981)"
                        />
                        <path
                          d="M63.77,174.6a1.154,1.154,0,0,0,1.139-1.168v-5.123H90.87v5.123a1.14,1.14,0,1,0,2.279,0v-5.123h25.961v5.123a1.14,1.14,0,1,0,2.279,0v-6.291a1.154,1.154,0,0,0-1.139-1.168h-27.1v-4.742h8.069a1.154,1.154,0,0,0,1.139-1.168v-5.348a1.154,1.154,0,0,0-1.139-1.168H82.8a1.154,1.154,0,0,0-1.14,1.168v5.348a1.154,1.154,0,0,0,1.14,1.168H90.87v4.742H63.77a1.154,1.154,0,0,0-1.139,1.168v6.291A1.154,1.154,0,0,0,63.77,174.6ZM83.94,155.88h16.138v3.012H83.94Z"
                          transform="translate(-53.115 -129.638)"
                        />
                        <path
                          d="M189.03,21.21h9.891a1.168,1.168,0,0,0,0-2.336h-8.671a8.044,8.044,0,0,1,15.978,0H204.24a1.168,1.168,0,0,0,0,2.336h3.207a1.154,1.154,0,0,0,1.139-1.168,10.621,10.621,0,0,0-6.462-9.826,5.938,5.938,0,0,0,1.858-4.33,5.745,5.745,0,1,0-11.487,0,5.937,5.937,0,0,0,1.858,4.33,10.621,10.621,0,0,0-6.462,9.826A1.154,1.154,0,0,0,189.03,21.21Zm5.744-15.323a3.466,3.466,0,1,1,6.93,0,3.466,3.466,0,1,1-6.93,0Z"
                          transform="translate(-159.343)"
                        />
                      </svg>
                      <p class="card-text">
                        Ideal for growing teams 2 level of hierarchy of planners
                      </p>
                      <hr />
                      <div style="text-align: left">
                        <span style="text-decoration: underline"
                          >Includes Project, plus:</span
                        ><br />
                        <div style="text-align: left; margin-left: 20px">
                          <span>* Timeline &amp; Gantt views</span><br />
                          <span>* Calendar view</span><br />
                          <span>* Guest access</span><br />
                          <span>* Automations<br />(250 actions per month)</span
                          ><br />
                          <span
                            >* Integrations<br />(250 actions per month)</span
                          ><br />
                          <span
                            >* Create a dashboard that combines up to 5
                            boards</span
                          >
                        </div>
                      </div>
                    </div>
                  </div>
                  <div
                    class="card border-success mb-3"
                    style="max-width: 18rem"
                  >
                    <div class="card-header">Pro</div>
                    <div class="card-body">
                      <span class="card-title" style="font-size: 22px"
                        >Scale Up</span
                      >
                      <br />
                      <div
                        style="
                          margin-top: 20px;
                          display: flex;
                          justify-content: center;
                          margin-bottom: 6px;
                        "
                      >
                        <span style="font-size: 38px; padding-top: 11px"
                          >${{ Math.round(prices.scaleup) }}</span
                        >
                        <div style="float: right">
                          <span style="font-size: 19px; margin-left: 11px"
                            >USD / seat<br />/ month</span
                          >
                        </div>
                      </div>
                      <span
                        >Total ${{ Math.round(prices.scaleup * selected) }} /
                        month</span
                      ><br />

                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="77.789"
                        height="69.338"
                        viewBox="0 0 77.789 69.338"
                        style="
                          margin-left: 38px;
                          margin-top: 20px;
                          margin-bottom: 20px;
                        "
                      >
                        <path
                          d="M202.124,319.325a5.938,5.938,0,0,0,1.858-4.33,5.746,5.746,0,1,0-11.488,0,5.937,5.937,0,0,0,1.858,4.33,10.621,10.621,0,0,0-6.462,9.826,1.154,1.154,0,0,0,1.139,1.168h18.417a1.154,1.154,0,0,0,1.139-1.168A10.622,10.622,0,0,0,202.124,319.325ZM194.773,315a3.466,3.466,0,1,1,3.465,3.551A3.513,3.513,0,0,1,194.773,315Zm-4.524,12.988a8.044,8.044,0,0,1,15.978,0Z"
                          transform="translate(-159.344 -260.981)"
                        />
                        <path
                          d="M380.385,315a5.937,5.937,0,0,0,1.858,4.33,10.621,10.621,0,0,0-6.462,9.826,1.154,1.154,0,0,0,1.14,1.168h18.417a1.154,1.154,0,0,0,1.14-1.168,10.621,10.621,0,0,0-6.462-9.826,5.938,5.938,0,0,0,1.858-4.33,5.746,5.746,0,1,0-11.488,0Zm13.733,12.988H378.14a8.044,8.044,0,0,1,15.978,0ZM389.594,315a3.466,3.466,0,1,1-3.465-3.551A3.513,3.513,0,0,1,389.594,315Z"
                          transform="translate(-318.688 -260.981)"
                        />
                        <path
                          d="M14.234,319.325A5.938,5.938,0,0,0,16.092,315a5.823,5.823,0,0,0-5.744-5.886A5.823,5.823,0,0,0,4.6,315a5.937,5.937,0,0,0,1.858,4.33A10.622,10.622,0,0,0,0,329.151a1.154,1.154,0,0,0,1.139,1.168H19.557a1.154,1.154,0,0,0,1.139-1.168A10.621,10.621,0,0,0,14.234,319.325ZM6.883,315a3.466,3.466,0,1,1,3.465,3.551A3.513,3.513,0,0,1,6.883,315ZM2.359,327.983a8.149,8.149,0,0,1,7.989-7.1,8.149,8.149,0,0,1,7.989,7.1Z"
                          transform="translate(0 -260.981)"
                        />
                        <path
                          d="M63.77,174.6a1.154,1.154,0,0,0,1.139-1.168v-5.123H90.87v5.123a1.14,1.14,0,1,0,2.279,0v-5.123h25.961v5.123a1.14,1.14,0,1,0,2.279,0v-6.291a1.154,1.154,0,0,0-1.139-1.168h-27.1v-4.742h8.069a1.154,1.154,0,0,0,1.139-1.168v-5.348a1.154,1.154,0,0,0-1.139-1.168H82.8a1.154,1.154,0,0,0-1.14,1.168v5.348a1.154,1.154,0,0,0,1.14,1.168H90.87v4.742H63.77a1.154,1.154,0,0,0-1.139,1.168v6.291A1.154,1.154,0,0,0,63.77,174.6ZM83.94,155.88h16.138v3.012H83.94Z"
                          transform="translate(-53.115 -129.638)"
                        />
                        <path
                          d="M189.03,21.21h9.891a1.168,1.168,0,0,0,0-2.336h-8.671a8.044,8.044,0,0,1,15.978,0H204.24a1.168,1.168,0,0,0,0,2.336h3.207a1.154,1.154,0,0,0,1.139-1.168,10.621,10.621,0,0,0-6.462-9.826,5.938,5.938,0,0,0,1.858-4.33,5.745,5.745,0,1,0-11.487,0,5.937,5.937,0,0,0,1.858,4.33,10.621,10.621,0,0,0-6.462,9.826A1.154,1.154,0,0,0,189.03,21.21Zm5.744-15.323a3.466,3.466,0,1,1,6.93,0,3.466,3.466,0,1,1-6.93,0Z"
                          transform="translate(-159.343)"
                        />
                      </svg>
                      <br />
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="61.719"
                        height="36.045"
                        viewBox="0 0 61.719 36.045"
                        style="
                          margin-top: -20px !important;
                          margin-left: -21px !important;
                        "
                      >
                        <g transform="translate(0 0)">
                          <path
                            d="M199.184,317.214a4.711,4.711,0,0,0,1.474-3.435,4.559,4.559,0,1,0-9.114,0,4.711,4.711,0,0,0,1.474,3.435,8.427,8.427,0,0,0-5.127,7.8.915.915,0,0,0,.9.927h14.612a.915.915,0,0,0,.9-.927A8.427,8.427,0,0,0,199.184,317.214Zm-5.832-3.435A2.75,2.75,0,1,1,196.1,316.6,2.787,2.787,0,0,1,193.351,313.779Zm-3.59,10.3a6.382,6.382,0,0,1,12.677,0Z"
                            transform="translate(-165.241 -289.892)"
                          />
                          <path
                            d="M379.434,313.779a4.71,4.71,0,0,0,1.474,3.435,8.427,8.427,0,0,0-5.127,7.8.915.915,0,0,0,.9.927H391.3a.915.915,0,0,0,.9-.927,8.427,8.427,0,0,0-5.127-7.8,4.711,4.711,0,0,0,1.474-3.435,4.559,4.559,0,1,0-9.114,0Zm10.9,10.3H377.653a6.382,6.382,0,0,1,12.677,0Zm-3.589-10.3a2.75,2.75,0,1,1-2.749-2.817A2.787,2.787,0,0,1,386.74,313.779Z"
                            transform="translate(-330.483 -289.892)"
                          />
                          <path
                            d="M11.294,317.214a4.711,4.711,0,0,0,1.474-3.435,4.62,4.62,0,0,0-4.557-4.67,4.62,4.62,0,0,0-4.557,4.67,4.711,4.711,0,0,0,1.474,3.435A8.427,8.427,0,0,0,0,325.01a.915.915,0,0,0,.9.927H15.516a.915.915,0,0,0,.9-.927A8.427,8.427,0,0,0,11.294,317.214Zm-5.832-3.435A2.75,2.75,0,1,1,8.21,316.6a2.787,2.787,0,0,1-2.749-2.817Zm-3.589,10.3a6.465,6.465,0,0,1,6.338-5.634,6.465,6.465,0,0,1,6.338,5.634Z"
                            transform="translate(0 -289.892)"
                          />
                          <path
                            d="M63.534,170.248a.915.915,0,0,0,.9-.927v-4.065h20.6v4.065a.9.9,0,1,0,1.808,0v-4.065h20.6v4.065a.9.9,0,1,0,1.808,0V164.33a.915.915,0,0,0-.9-.927h-21.5v-3.762h6.4a.915.915,0,0,0,.9-.927v-4.243a.915.915,0,0,0-.9-.926H78.633a.915.915,0,0,0-.9.926v4.243a.915.915,0,0,0,.9.927h6.4V163.4h-21.5a.915.915,0,0,0-.9.927v4.991A.916.916,0,0,0,63.534,170.248Zm16-14.85h12.8v2.39h-12.8Z"
                            transform="translate(-55.08 -153.545)"
                          />
                        </g>
                      </svg>
                      <p class="card-text">
                        Ideal for organizations 3 level of hierarchy of planners
                      </p>
                      <hr />
                      <div style="text-align: left">
                        <span style="text-decoration: underline"
                          >Includes Start Up, plus:</span
                        ><br />
                        <div style="text-align: left; margin-left: 20px">
                          <span>* Private boards and docs</span><br />
                          <span>* Chart view</span><br />
                          <span>* Time tracking</span><br />
                          <span>* Formula column</span><br />
                          <span>* Dependancy column</span><br />
                          <span
                            >* Automations<br />(25,000 actions per month)</span
                          ><br />
                          <span
                            >* Integrations<br />(25,000 actions per
                            month)</span
                          ><br />
                          <span
                            >* Create a dashboard that combines up to 10
                            boards</span
                          >
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card border-info mb-3" style="max-width: 18rem">
                    <div class="card-header">Enterprise</div>
                    <div class="card-body">
                      <span class="card-title" style="font-size: 22px"
                        >Expand Up</span
                      >
                      <br />
                      <div
                        style="
                          margin-top: 20px;
                          display: flex;
                          justify-content: center;
                        "
                      >
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          width="46.719"
                          height="52"
                          viewBox="0 0 46.719 52"
                          style="margin-left: 0px; margin-bottom: 20px"
                        >
                          <g transform="translate(-26)">
                            <g transform="translate(59.516 40.219)">
                              <path
                                d="M357.016,396a1.016,1.016,0,1,0,1.016,1.016A1.016,1.016,0,0,0,357.016,396Z"
                                transform="translate(-356 -396)"
                              />
                            </g>
                            <g transform="translate(26)">
                              <g transform="translate(0)">
                                <path
                                  d="M63.032,36.935,58.2,35.326,56.472,31.86a11.124,11.124,0,0,0,3.011-5.885l.216-1.3h1.848a3.05,3.05,0,0,0,3.047-3.047v-6.4a15.234,15.234,0,0,0-30.469,0v6.4A3.052,3.052,0,0,0,36.156,24.5V25.7A3.05,3.05,0,0,0,39.2,28.742H40.1a11.018,11.018,0,0,0,1.7,2.638c.144.165.294.326.447.482l-1.732,3.464-4.827,1.609C30.074,38.806,26,44.715,26,50.984A1.016,1.016,0,0,0,27.016,52H71.7a1.016,1.016,0,0,0,1.016-1.016C72.719,44.715,68.645,38.806,63.032,36.935Zm-.469-15.3a1.017,1.017,0,0,1-1.016,1.016H60c.258-2,.43-4.128.5-6.224,0-.059,0-.117.005-.175h2.061ZM37.172,22.648a1.017,1.017,0,0,1-1.016-1.016V16.25h2.062q.005.159.011.32v.011h0c.071,2.039.241,4.111.493,6.067h-1.55ZM39.2,26.711A1.017,1.017,0,0,1,38.188,25.7V24.68h.833l.216,1.3c.041.246.092.492.151.735ZM38.189,14.219H36.195a13.2,13.2,0,0,1,26.329,0H60.53A10.287,10.287,0,0,0,50.268,4.063H48.451A10.287,10.287,0,0,0,38.189,14.219ZM48.45,6.094h1.818A8.258,8.258,0,0,1,58.5,14.362c0,.32,0,.6-.008.851,0,0,0,.007,0,.01l-1.27-.181a16.32,16.32,0,0,1-9.175-4.588,1.016,1.016,0,0,0-.718-.3A9.188,9.188,0,0,0,40.264,13.5,8.256,8.256,0,0,1,48.45,6.094ZM41.492,26.711a58.052,58.052,0,0,1-1.219-9.857l1.367-1.823A7.149,7.149,0,0,1,46.927,12.2a18.37,18.37,0,0,0,10.008,4.853l1.5.214c-.1,2.121-.3,4.25-.6,6.207v0c-.093.629-.166,1.034-.354,2.166a8.627,8.627,0,0,1-6.123,6.938,7.991,7.991,0,0,1-8.971-3.837h2.07a3.052,3.052,0,0,0,2.872,2.031h2.031a3.047,3.047,0,0,0,0-6.094H47.328a3.048,3.048,0,0,0-2.874,2.031Zm5.75,7.923a10.187,10.187,0,0,0,3.778.085l-1.795,1.9Zm.587,3.46L44.608,41.5a38.7,38.7,0,0,1-2.274-5.273l1.21-2.419ZM55,33.464l1.382,2.763A38.684,38.684,0,0,1,54.11,41.5l-3.448-3.448Zm-8.69-5.738a1.016,1.016,0,0,1,1.016-1.016h2.031a1.016,1.016,0,0,1,0,2.031H47.328A1.017,1.017,0,0,1,46.313,27.727ZM28.072,49.969a12.835,12.835,0,0,1,8.257-11.107L40.6,37.437a40.713,40.713,0,0,0,2.891,6.27l.006.01h0a40.726,40.726,0,0,0,2.78,4.245l1.249,2.006Zm21.287-.905-1.377-2.211q-.023-.037-.049-.072a38.726,38.726,0,0,1-2.288-3.419l3.622-3.83,3.817,3.817a38.682,38.682,0,0,1-2.3,3.432C50.737,46.846,50.807,46.742,49.359,49.063Zm1.829.905,1.249-2.006a40.709,40.709,0,0,0,2.8-4.279l.015-.027,0,0a40.681,40.681,0,0,0,2.86-6.217l4.275,1.425a12.835,12.835,0,0,1,8.257,11.107H51.189Z"
                                  transform="translate(-26)"
                                />
                              </g>
                            </g>
                            <g transform="translate(63.084 42.157)">
                              <path
                                d="M395.649,418.79a10.154,10.154,0,0,0-2.875-3.49,1.016,1.016,0,0,0-1.239,1.61,8.11,8.11,0,0,1,2.3,2.788,1.016,1.016,0,0,0,1.817-.908Z"
                                transform="translate(-391.139 -415.088)"
                              />
                            </g>
                          </g>
                        </svg>
                        <div
                          style="
                            float: right;
                            padding-top: 20 px;
                            padding-left: 5 px;
                          "
                        >
                          <span style="font-size: 19px; margin-left: 11px"
                            >Contact our<br />sales team</span
                          >
                        </div>
                      </div>
                      <br />
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="77.789"
                        height="69.338"
                        viewBox="0 0 77.789 69.338"
                        style="
                          margin-left: 65px;
                          margin-top: -25px;
                          margin-bottom: 20px;
                        "
                      >
                        <path
                          d="M202.124,319.325a5.938,5.938,0,0,0,1.858-4.33,5.746,5.746,0,1,0-11.488,0,5.937,5.937,0,0,0,1.858,4.33,10.621,10.621,0,0,0-6.462,9.826,1.154,1.154,0,0,0,1.139,1.168h18.417a1.154,1.154,0,0,0,1.139-1.168A10.622,10.622,0,0,0,202.124,319.325ZM194.773,315a3.466,3.466,0,1,1,3.465,3.551A3.513,3.513,0,0,1,194.773,315Zm-4.524,12.988a8.044,8.044,0,0,1,15.978,0Z"
                          transform="translate(-159.344 -260.981)"
                        />
                        <path
                          d="M380.385,315a5.937,5.937,0,0,0,1.858,4.33,10.621,10.621,0,0,0-6.462,9.826,1.154,1.154,0,0,0,1.14,1.168h18.417a1.154,1.154,0,0,0,1.14-1.168,10.621,10.621,0,0,0-6.462-9.826,5.938,5.938,0,0,0,1.858-4.33,5.746,5.746,0,1,0-11.488,0Zm13.733,12.988H378.14a8.044,8.044,0,0,1,15.978,0ZM389.594,315a3.466,3.466,0,1,1-3.465-3.551A3.513,3.513,0,0,1,389.594,315Z"
                          transform="translate(-318.688 -260.981)"
                        />
                        <path
                          d="M14.234,319.325A5.938,5.938,0,0,0,16.092,315a5.823,5.823,0,0,0-5.744-5.886A5.823,5.823,0,0,0,4.6,315a5.937,5.937,0,0,0,1.858,4.33A10.622,10.622,0,0,0,0,329.151a1.154,1.154,0,0,0,1.139,1.168H19.557a1.154,1.154,0,0,0,1.139-1.168A10.621,10.621,0,0,0,14.234,319.325ZM6.883,315a3.466,3.466,0,1,1,3.465,3.551A3.513,3.513,0,0,1,6.883,315ZM2.359,327.983a8.149,8.149,0,0,1,7.989-7.1,8.149,8.149,0,0,1,7.989,7.1Z"
                          transform="translate(0 -260.981)"
                        />
                        <path
                          d="M63.77,174.6a1.154,1.154,0,0,0,1.139-1.168v-5.123H90.87v5.123a1.14,1.14,0,1,0,2.279,0v-5.123h25.961v5.123a1.14,1.14,0,1,0,2.279,0v-6.291a1.154,1.154,0,0,0-1.139-1.168h-27.1v-4.742h8.069a1.154,1.154,0,0,0,1.139-1.168v-5.348a1.154,1.154,0,0,0-1.139-1.168H82.8a1.154,1.154,0,0,0-1.14,1.168v5.348a1.154,1.154,0,0,0,1.14,1.168H90.87v4.742H63.77a1.154,1.154,0,0,0-1.139,1.168v6.291A1.154,1.154,0,0,0,63.77,174.6ZM83.94,155.88h16.138v3.012H83.94Z"
                          transform="translate(-53.115 -129.638)"
                        />
                        <path
                          d="M189.03,21.21h9.891a1.168,1.168,0,0,0,0-2.336h-8.671a8.044,8.044,0,0,1,15.978,0H204.24a1.168,1.168,0,0,0,0,2.336h3.207a1.154,1.154,0,0,0,1.139-1.168,10.621,10.621,0,0,0-6.462-9.826,5.938,5.938,0,0,0,1.858-4.33,5.745,5.745,0,1,0-11.487,0,5.937,5.937,0,0,0,1.858,4.33,10.621,10.621,0,0,0-6.462,9.826A1.154,1.154,0,0,0,189.03,21.21Zm5.744-15.323a3.466,3.466,0,1,1,6.93,0,3.466,3.466,0,1,1-6.93,0Z"
                          transform="translate(-159.343)"
                        />
                      </svg>
                      <br />
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="61.719"
                        height="36.045"
                        viewBox="0 0 61.719 36.045"
                        style="
                          margin-top: -20px !important;
                          margin-left: 8px !important;
                        "
                      >
                        <g transform="translate(0 0)">
                          <path
                            d="M199.184,317.214a4.711,4.711,0,0,0,1.474-3.435,4.559,4.559,0,1,0-9.114,0,4.711,4.711,0,0,0,1.474,3.435,8.427,8.427,0,0,0-5.127,7.8.915.915,0,0,0,.9.927h14.612a.915.915,0,0,0,.9-.927A8.427,8.427,0,0,0,199.184,317.214Zm-5.832-3.435A2.75,2.75,0,1,1,196.1,316.6,2.787,2.787,0,0,1,193.351,313.779Zm-3.59,10.3a6.382,6.382,0,0,1,12.677,0Z"
                            transform="translate(-165.241 -289.892)"
                          />
                          <path
                            d="M379.434,313.779a4.71,4.71,0,0,0,1.474,3.435,8.427,8.427,0,0,0-5.127,7.8.915.915,0,0,0,.9.927H391.3a.915.915,0,0,0,.9-.927,8.427,8.427,0,0,0-5.127-7.8,4.711,4.711,0,0,0,1.474-3.435,4.559,4.559,0,1,0-9.114,0Zm10.9,10.3H377.653a6.382,6.382,0,0,1,12.677,0Zm-3.589-10.3a2.75,2.75,0,1,1-2.749-2.817A2.787,2.787,0,0,1,386.74,313.779Z"
                            transform="translate(-330.483 -289.892)"
                          />
                          <path
                            d="M11.294,317.214a4.711,4.711,0,0,0,1.474-3.435,4.62,4.62,0,0,0-4.557-4.67,4.62,4.62,0,0,0-4.557,4.67,4.711,4.711,0,0,0,1.474,3.435A8.427,8.427,0,0,0,0,325.01a.915.915,0,0,0,.9.927H15.516a.915.915,0,0,0,.9-.927A8.427,8.427,0,0,0,11.294,317.214Zm-5.832-3.435A2.75,2.75,0,1,1,8.21,316.6a2.787,2.787,0,0,1-2.749-2.817Zm-3.589,10.3a6.465,6.465,0,0,1,6.338-5.634,6.465,6.465,0,0,1,6.338,5.634Z"
                            transform="translate(0 -289.892)"
                          />
                          <path
                            d="M63.534,170.248a.915.915,0,0,0,.9-.927v-4.065h20.6v4.065a.9.9,0,1,0,1.808,0v-4.065h20.6v4.065a.9.9,0,1,0,1.808,0V164.33a.915.915,0,0,0-.9-.927h-21.5v-3.762h6.4a.915.915,0,0,0,.9-.927v-4.243a.915.915,0,0,0-.9-.926H78.633a.915.915,0,0,0-.9.926v4.243a.915.915,0,0,0,.9.927h6.4V163.4h-21.5a.915.915,0,0,0-.9.927v4.991A.916.916,0,0,0,63.534,170.248Zm16-14.85h12.8v2.39h-12.8Z"
                            transform="translate(-55.08 -153.545)"
                          />
                        </g>
                      </svg>
                      <br />
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="61.719"
                        height="36.045"
                        viewBox="0 0 61.719 36.045"
                        style="margin-left: -38px !important"
                      >
                        <g transform="translate(0 0)">
                          <path
                            d="M199.184,317.214a4.711,4.711,0,0,0,1.474-3.435,4.559,4.559,0,1,0-9.114,0,4.711,4.711,0,0,0,1.474,3.435,8.427,8.427,0,0,0-5.127,7.8.915.915,0,0,0,.9.927h14.612a.915.915,0,0,0,.9-.927A8.427,8.427,0,0,0,199.184,317.214Zm-5.832-3.435A2.75,2.75,0,1,1,196.1,316.6,2.787,2.787,0,0,1,193.351,313.779Zm-3.59,10.3a6.382,6.382,0,0,1,12.677,0Z"
                            transform="translate(-165.241 -289.892)"
                          />
                          <path
                            d="M379.434,313.779a4.71,4.71,0,0,0,1.474,3.435,8.427,8.427,0,0,0-5.127,7.8.915.915,0,0,0,.9.927H391.3a.915.915,0,0,0,.9-.927,8.427,8.427,0,0,0-5.127-7.8,4.711,4.711,0,0,0,1.474-3.435,4.559,4.559,0,1,0-9.114,0Zm10.9,10.3H377.653a6.382,6.382,0,0,1,12.677,0Zm-3.589-10.3a2.75,2.75,0,1,1-2.749-2.817A2.787,2.787,0,0,1,386.74,313.779Z"
                            transform="translate(-330.483 -289.892)"
                          />
                          <path
                            d="M11.294,317.214a4.711,4.711,0,0,0,1.474-3.435,4.62,4.62,0,0,0-4.557-4.67,4.62,4.62,0,0,0-4.557,4.67,4.711,4.711,0,0,0,1.474,3.435A8.427,8.427,0,0,0,0,325.01a.915.915,0,0,0,.9.927H15.516a.915.915,0,0,0,.9-.927A8.427,8.427,0,0,0,11.294,317.214Zm-5.832-3.435A2.75,2.75,0,1,1,8.21,316.6a2.787,2.787,0,0,1-2.749-2.817Zm-3.589,10.3a6.465,6.465,0,0,1,6.338-5.634,6.465,6.465,0,0,1,6.338,5.634Z"
                            transform="translate(0 -289.892)"
                          />
                          <path
                            d="M63.534,170.248a.915.915,0,0,0,.9-.927v-4.065h20.6v4.065a.9.9,0,1,0,1.808,0v-4.065h20.6v4.065a.9.9,0,1,0,1.808,0V164.33a.915.915,0,0,0-.9-.927h-21.5v-3.762h6.4a.915.915,0,0,0,.9-.927v-4.243a.915.915,0,0,0-.9-.926H78.633a.915.915,0,0,0-.9.926v4.243a.915.915,0,0,0,.9.927h6.4V163.4h-21.5a.915.915,0,0,0-.9.927v4.991A.916.916,0,0,0,63.534,170.248Zm16-14.85h12.8v2.39h-12.8Z"
                            transform="translate(-55.08 -153.545)"
                          />
                        </g>
                      </svg>
                      <p class="card-text">
                        Ideal for enterprises 4 level of more of structure of
                        planners
                      </p>
                      <hr />
                      <div style="text-align: left">
                        <span style="text-decoration: underline"
                          >Includes Pro, plus:</span
                        ><br />
                        <div style="text-align: left; margin-left: 20px">
                          <span
                            >* Enterprise-scale Automations &amp;
                            Integrations</span
                          ><br />
                          <span>* Enterprise-grade security</span><br />
                          <span>* Advanced reporting <br />&amp; analytics</span
                          ><br />
                          <span>* Multi-level permissions</span><br />
                          <span>* Tailored onboarding</span><br />
                          <span>* Premium-support</span><br />
                          <span
                            >* Create a dashboard that combines up to 50
                            boards</span
                          >
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <a
              href="#"
              @click="dialog_edit_plan = false"
              style="
                font: normal normal 490 16px Montserrat;
                letter-spacing: 0px;
                margin-right: 10px;
                text-decoration: none;
                color: grey;
                font-weight: bolder;
              "
              >Cancel</a
            >
            <button
              v-if="plan_type == 2 || plan_type == 3"
              @click="dialog_continue = !dialog_continue"
              class="submit btn btn-primary"
              style="
                font: normal normal 490 16px Montserrat;
                padding: 8px 12px;
                height: auto;
                background-color: #3499ff;
                border-color: #3499ff;
              "
            >
              Continue
            </button>
            <button
              v-if="plan_type == 4"
              @click="dialog_continue = !dialog_continue"
              class="submit btn btn-primary"
              style="
                font: normal normal 490 16px Montserrat;
                padding: 8px 12px;
                height: auto;
                background-color: #3499ff;
                border-color: #3499ff;
              "
            >
              Contact sales team
            </button>
          </div>
        </div>
      </v-card-text>
    </v-dialog>

    <v-dialog v-if="plan_type != 4" v-model="dialog_continue" max-width="85vw">
      <div class="modal-content">
        <div class="modal-header" style="padding: 0px !important">
          <v-toolbar flat dark color="primary">
            <v-spacer></v-spacer>
            <v-btn icon dark @click="dialog_continue = false">
              <v-icon>mdi-close</v-icon>
            </v-btn>
          </v-toolbar>
        </div>

        <div
          class="modal-body"
          style="
            padding: 11rem;
            text-align: center;
            padding-top: 20px !important;
            padding-bottom: 0.5rem;
          "
        >
          <div class="form-group">
            <div>
              <span
                class="modal-title"
                style="
                  display: inline-block;
                  font-family: 'Montserrat';
                  font-size: 30px;
                  font-weight: bold;
                "
              >
                Purchase your plan
              </span>
            </div>
            <div class="modal-body" style="padding: 1rem">
              <div class="form-group">
                <v-row style="justify-content: space-evenly">
                  <v-col
                    class="col-7"
                    style="
                      border: ridge;
                      border-radius: 15px;
                      max-width: 28.6vw;
                    "
                  >
                    <div style="text-align: left; padding-top: 13px">
                      <span style="font-size: 20px">Payment details</span>
                      <v-row>
                        <br />
                        <v-col class="col-4" style="padding: 5px !important">
                          <v-text-field
                            label="Credit card number"
                            :rules="rules"
                            hide-details="auto"
                            outlined
                            dense
                          ></v-text-field>
                        </v-col>
                        <v-col class="col-5" style="padding: 5px !important">
                          <v-menu
                            v-model="ex_menu2"
                            :close-on-content-click="false"
                            :nudge-right="40"
                            transition="scale-transition"
                            offset-y
                            min-width="auto"
                          >
                            <template v-slot:activator="{ on, ex_attrs }">
                              <v-text-field
                                v-model="ex_date"
                                label="Expiration date"
                                prepend-icon="mdi-calendar"
                                readonly
                                v-bind="ex_attrs"
                                v-on="on"
                                outlined
                                dense
                                type="month"
                              ></v-text-field>
                            </template>
                            <v-date-picker
                              v-model="ex_date"
                              type="month"
                              @input="ex_menu2 = false"
                            ></v-date-picker>
                          </v-menu>
                        </v-col>
                        <v-col class="col-3" style="padding: 5px !important">
                          <v-text-field
                            label="CVV"
                            :rules="ex_rules"
                            hide-details="auto"
                            outlined
                            dense
                          ></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col class="col-12">
                          <v-text-field
                            label="Cardholder name"
                            :rules="ex_rules"
                            hide-details="auto"
                            outlined
                            dense
                          ></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row style="padding-top: 12px !important">
                        <v-col class="col-12">
                          <v-text-field
                            label="Address line 1"
                            :rules="ex_rules"
                            hide-details="auto"
                            outlined
                            dense
                          ></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row style="padding-top: 12px !important">
                        <v-col class="col-12">
                          <v-text-field
                            label="Address line 2"
                            :rules="ex_rules"
                            outlined
                            dense
                            hide-details="auto"
                          ></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row style="padding-top: 12px !important">
                        <v-col class="col-6">
                          <v-text-field
                            label="City"
                            :rules="ex_rules"
                            hide-details="auto"
                            outlined
                            dense
                          ></v-text-field>
                        </v-col>
                        <v-col class="col-6">
                          <v-text-field
                            label="Zip / Postal"
                            :rules="ex_rules"
                            outlined
                            dense
                            hide-details="auto"
                          ></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row style="padding-top: 12px !important">
                        <v-col class="col-6">
                          <v-select
                            v-model="ex_e3"
                            :items="ex_states"
                            menu-props="auto"
                            label="Country"
                            hide-details
                            prepend-icon="mdi-map"
                            outlined
                            dense
                            :rules="ex_rules"
                          ></v-select>
                        </v-col>
                        <v-col class="col-6">
                          <v-text-field
                            label="State / Province"
                            :rules="ex_rules"
                            hide-details="auto"
                            outlined
                            dense
                          ></v-text-field>
                        </v-col>
                      </v-row>
                    </div>
                    <p
                      style="
                        font: normal normal 490 15px Montserrat;
                        padding-left: 20px;
                        padding-right: 20px;
                        padding-top: 15px;
                      "
                    >
                      Your privacy is super important to us - we'll only use
                      your information as described in our
                      <a style="color: #0c95fe; font-weight: bold"
                        >terms of use</a
                      >
                      and
                      <a style="color: #0c95fe; font-weight: bold"
                        >Privacy Policy</a
                      >
                    </p>
                  </v-col>
                  <v-col
                    class="col-5"
                    style="
                      border: ridge;
                      border-radius: 15px;
                      max-width: 27.9vw;
                      padding: 25px;
                    "
                  >
                    <div style="text-align: left !important">
                      <div
                        style="
                          margin-bottom: 20px;
                          display: flex;
                          justify-content: space-between;
                        "
                      >
                        <span style="font-weight: bolder; font-size: 20px"
                          >Your plan</span
                        >
                        <v-btn
                          class="ma-2"
                          @click="
                            dialog_continue_edit_button =
                              !dialog_continue_edit_button
                          "
                          outlined
                          color="indigo"
                        >
                          Edit
                        </v-btn>
                      </div>
                      <div
                        style="display: flex; justify-content: space-between"
                      >
                        <span>Company name</span>
                      </div>
                      <div
                        style="display: flex; justify-content: space-between"
                      >
                        <span v-if="plan_type == 1">Project</span>
                        <span v-if="plan_type == 2">Start Up</span>
                        <span v-if="plan_type == 3">Scale Up</span>
                        <span v-if="plan_type == 4">Expand Up</span>
                      </div>
                      <div
                        v-if="pay_mode == false"
                        style="display: flex; justify-content: space-between"
                      >
                        <span>Billing monthly</span>
                        <span v-if="plan_type == 2 && pay_mode == false"
                          >Switch to annual and save ${{
                            Math.round(
                              selected * 10 * 12 -
                                selected * prices.startup * 0.18 * 12
                            )
                          }}/yr</span
                        >
                        <span v-if="plan_type == 3 && pay_mode == false"
                          >Switch to annual and save ${{
                            Math.round(
                              selected * 25 * 12 -
                                selected * prices.scaleup * 0.18 * 12
                            )
                          }}/yr</span
                        >
                        <span v-if="plan_type == 2 && pay_mode == true"
                          >Annual savings USD ${{
                            Math.round(
                              selected * 10 * 12 -
                                selected * prices.startup * 0.18 * 12
                            )
                          }}/yr</span
                        >
                        <span v-if="plan_type == 3 && pay_mode == true"
                          >Annual savings USD ${{
                            Math.round(
                              selected * 25 * 12 -
                                selected * prices.scaleup * 0.18 * 12
                            )
                          }}/yr</span
                        >
                      </div>
                      <div
                        style="display: flex; justify-content: space-between"
                      >
                        <span>{{ selected }} seats</span>
                        <span v-if="plan_type == 2 && pay_mode == false"
                          >$10 USD / seat / month</span
                        >
                        <span v-if="plan_type == 3 && pay_mode == false"
                          >$25 USD / seat / month</span
                        >
                        <span v-if="plan_type == 2 && pay_mode == true"
                          >${{ Math.round(prices.startup) }} USD / seat /
                          month</span
                        >
                        <span v-if="plan_type == 3 && pay_mode == true"
                          >${{ Math.round(prices.scaleup) }} USD / seat /
                          month</span
                        >
                      </div>
                      <hr />
                      <div
                        style="display: flex; justify-content: space-between"
                      >
                        <span style="font-size: 20px">Total</span>
                        <span v-if="pay_mode == false && plan_type == 2"
                          >${{ prices.startup * selected }} USD</span
                        >
                        <span v-if="pay_mode == false && plan_type == 3"
                          >${{ prices.scaleup * selected }} USD</span
                        >
                        <span v-if="pay_mode == true && plan_type == 2"
                          >${{ prices.startup * selected * 12 }} USD/year</span
                        >
                        <span v-if="pay_mode == true && plan_type == 3"
                          >${{ prices.scaleup * selected * 12 }} USD/year</span
                        >
                      </div>
                      <div style="display: flex; justify-content: end">
                        <span style="font-size: 14px; font-weight: 400"
                          >+ applicable tax</span
                        >
                      </div>
                      <div style="display: flex; justify-content: end">
                        <button
                          type="submit"
                          class="submit btn btn-primary"
                          style="
                            font: normal normal 490 16px Montserrat;
                            padding: 8px 12px;
                            height: auto;
                            background-color: #3499ff;
                            border-color: #3499ff;
                          "
                        >
                          Submit purchase
                        </button>
                      </div>
                    </div>
                  </v-col>
                </v-row>
              </div>
            </div>
          </div>
        </div>
      </div>
    </v-dialog>
    <v-dialog v-if="plan_type == 4" v-model="dialog_continue" max-width="50vw">
      <div class="modal-content">
        <div class="modal-header" style="padding: 0px !important">
          <v-toolbar flat dark color="primary">
            <v-spacer></v-spacer>
            <v-btn icon dark @click="dialog_continue = false">
              <v-icon>mdi-close</v-icon>
            </v-btn>
          </v-toolbar>
        </div>
        <div class="modal-body" style="text-align: center">
          <div class="form-group">
            <div>
              <span
                class="modal-title"
                style="
                  display: inline-block;
                  font-family: 'Montserrat';
                  font-size: 30px;
                  font-weight: bold;
                "
              >
                Talk with our sales team
              </span>
            </div>
            <div class="modal-body" style="padding: 1rem">
              <div class="form-group">
                <v-row style="justify-content: space-evenly">
                  <v-col
                    class="col-12"
                    style="border: ridge; border-radius: 15px"
                  >
                    <div style="text-align: left; padding-top: 13px">
                      <v-row style="padding-top: 12px !important">
                        <v-col cols="12" sm="6">
                          <v-text-field
                            v-model="title"
                            :rules="[sales_rules.required, sales_rules.counter]"
                            label="Name *"
                            placeholder="e.g., John Smith"
                            outlined
                            dense
                          ></v-text-field>
                        </v-col>

                        <v-col cols="12" sm="6">
                          <v-text-field
                            v-model="email"
                            :rules="[sales_rules.required, sales_rules.email]"
                            label="Company Email *"
                            placeholder="name@company.com"
                            outlined
                            dense
                          ></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row style="padding-top: 12px !important">
                        <v-col class="col-6">
                          <v-text-field
                            label="Phone Number"
                            :rules="ex_rules"
                            placeholder="+1 555 655 5656"
                            outlined
                            dense
                            hide-details="auto"
                          ></v-text-field>
                        </v-col>
                        <v-col class="col-6">
                          <v-select
                            v-model="ex_e3"
                            :items="company_sizes"
                            menu-props="auto"
                            label="Company Size *"
                            hide-details
                            outlined
                            dense
                            :rules="ex_rules"
                          ></v-select>
                        </v-col>
                      </v-row>
                      <v-row style="padding-top: 12px !important">
                        <v-col class="col-6">
                          <v-select
                            v-model="ex_e3"
                            :items="headquarters"
                            menu-props="auto"
                            label="Company Headquarters *"
                            hide-details
                            outlined
                            dense
                            :rules="ex_rules"
                          ></v-select>
                        </v-col>
                        <v-col class="col-6">
                          <v-textarea
                            label="What would you like to discuss? *"
                            auto-grow
                            outlined
                            rows="7"
                            row-height="20"
                            placeholder="Tell us about your team and provide some details about a project or process you would like to track in Stratigo."
                          ></v-textarea>
                        </v-col>
                      </v-row>
                    </div>
                    <p
                      style="
                        font: normal normal 490 14px Montserrat;
                        padding-left: 20px;
                        padding-right: 20px;
                        padding-top: 15px;
                        color: #f2a100;
                        text-align: left !important;
                      "
                    >
                      Fileds marked with an asterisk (*) are required
                    </p>
                    <button
                      type="submit"
                      class="submit btn btn-primary"
                      style="
                        font: normal normal 490 18px Montserrat;
                        padding: 12px 30px;
                        height: auto;
                        background-color: #3499ff;
                        border-color: #3499ff;
                      "
                    >
                      Submit
                    </button>
                    <p
                      style="
                        font: normal normal 490 15px Montserrat;
                        padding-left: 20px;
                        padding-right: 20px;
                        padding-top: 15px;
                      "
                    >
                      Looking for more information or want to try one of our
                      paid Stratigo plans? Submit your information and an
                      Stratigo representative will follow up with you as soon as
                      possible.
                    </p>
                  </v-col>
                </v-row>
              </div>
            </div>
          </div>
        </div>
      </div>
    </v-dialog>
    <v-dialog v-model="dialog_continue_edit_button" max-width="660px">
      <v-card>
        <v-card-title style="background-color: #f9f8f8">
          <span style="font-size: 22px">Change plan details</span>
          <v-spacer></v-spacer>
        </v-card-title>
        <hr style="margin-top: 0px !important" />
        <div>
          <v-row>
            <v-col class="col-8">
              <div>
                <v-row>
                  <v-col class="col-12">
                    <v-select
                      v-model="plan_type"
                      :items="stratigo_plans"
                      menu-props="auto"
                      label="Stratigo Plan"
                      item-text="title"
                      item-value="val"
                      hide-details
                      dense
                    ></v-select>
                  </v-col>
                </v-row>
              </div>
              <div>
                <v-row>
                  <v-col
                    class="col-6"
                    style="
                      padding-left: 0px;
                      padding-right: 0px;
                      padding-top: 18px;
                    "
                  >
                    <span style="font-size: 14px; margin-left: 24px"
                      >Monthly</span
                    >
                    <div style="float: right; display: flex">
                      <v-switch
                        v-model="pay_mode"
                        @change="currentDataItems"
                        style="margin-top: 0px; padding-top: 0px"
                      ></v-switch>
                      <span style="font-size: 14px">Annual</span>
                    </div>
                  </v-col>
                  <v-col class="col-6">
                    <v-select
                      label="Seats"
                      v-model="selected"
                      :items="sizes"
                      item-text="name"
                      item-value="val"
                      hide-details
                      dense
                    />
                  </v-col>
                </v-row>
              </div>
              <div style="margin-top: 40px">
                <v-row style="justify-content: end">
                  <v-btn
                    color="primary"
                    text
                    @click="dialog_continue_edit_button = false"
                  >
                    Close
                  </v-btn>
                  <button
                    type="submit"
                    class="submit btn btn-primary"
                    style="
                      font: normal normal 490 16px Montserrat;
                      padding: 8px 12px;
                      height: auto;
                      background-color: #3499ff;
                      border-color: #3499ff;
                    "
                  >
                    Update plan
                  </button>
                </v-row>
              </div>
            </v-col>
            <v-col class="col-4">
              <v-sheet
                color="#f9f8f8"
                elevation="9"
                height="230"
                width="170"
                style="padding: 25px; padding-top: 10px"
              >
                <span style="font-size: 12px">Seat</span><br />
                <span
                  style="font-size: 22px"
                  v-if="plan_type == 2 && pay_mode == false"
                  >$10<span style="font-size: 12px">/month</span></span
                >
                <span
                  style="font-size: 22px"
                  v-if="plan_type == 3 && pay_mode == false"
                  >$25<span style="font-size: 12px">/month</span></span
                >
                <span
                  style="font-size: 22px"
                  v-if="plan_type == 2 && pay_mode == true"
                  >${{ Math.round(prices.startup)
                  }}<span style="font-size: 12px">/month</span></span
                >
                <span
                  style="font-size: 22px"
                  v-if="plan_type == 3 && pay_mode == true"
                  >${{ Math.round(prices.scaleup)
                  }}<span style="font-size: 12px">/month</span></span
                ><br />
                <div style="margin-top: 20px">
                  <span style="font-size: 12px">Total (USD)</span><br />
                  <span
                    style="font-size: 22px"
                    v-if="pay_mode == false && plan_type == 2"
                    >${{ prices.startup * selected * 12
                    }}<span style="font-size: 12px">/year</span>
                  </span>
                  <span
                    style="font-size: 22px"
                    v-if="pay_mode == false && plan_type == 3"
                    >${{ prices.scaleup * selected * 12
                    }}<span style="font-size: 12px">/year</span>
                  </span>
                  <span
                    style="font-size: 22px"
                    v-if="pay_mode == true && plan_type == 2"
                    >${{ prices.startup * selected * 12
                    }}<span style="font-size: 12px">/year</span></span
                  >
                  <span
                    style="font-size: 22px"
                    v-if="pay_mode == true && plan_type == 3"
                    >${{ prices.scaleup * selected * 12
                    }}<span style="font-size: 12px">/year</span></span
                  ><br />
                </div>
                <hr />
                <span v-if="pay_mode == false" style="font-size: 12px"
                  >Save 18% with an annual plan</span
                >
                <span
                  v-if="pay_mode == true"
                  style="font-size: 12px; color: #5da283"
                  >You are saving 18% with an annual plan</span
                >
              </v-sheet>
            </v-col>
          </v-row>
        </div>
        <v-card-actions> </v-card-actions>
      </v-card>
    </v-dialog>

    <!-- Contacting support -->

    <v-dialog
      v-model="dialog_contact_support"
      transition="dialog-top-transition"
      max-width="600"
    >
      <div class="modal-content">
        <div class="modal-header" style="padding: 30px 30px 15px 30px">
          <h5
            class="modal-title"
            style="
              display: inline-block;
              font-family: 'Montserrat';
              font-size: 20px;
              font-weight: bold;
            "
          >
            Contact support
          </h5>
          <button
            type="button"
            class="close"
            @click="dialog_contact_support = false"
            aria-label="Close"
          >
            <span aria-hidden="true" style="font-size: 32px">&times;</span>
          </button>
        </div>

        <form id="contact_support" @submit.prevent="store()">
          <div class="modal-body" style="padding: 1rem">
            <div class="form-group">
              <div>
                <v-row>
                  <v-col class="col-12">
                    <v-text-field
                      label="What is your question?"
                      :rules="rules"
                      hide-details="auto"
                      outlined
                      dense
                    ></v-text-field>
                  </v-col>
                </v-row>
                <v-row>
                  <v-col class="col-12">
                    <v-textarea
                      label="Details"
                      auto-grow
                      outlined
                      rows="10"
                      row-height="30"
                    ></v-textarea>
                  </v-col>
                </v-row>
              </div>
              <v-row>
                <v-col class="col-1" style="padding: 0px">
                  <v-checkbox
                    color="info"
                    value="info"
                    hide-details
                    style="margin-left: 14px"
                  ></v-checkbox>
                </v-col>
                <v-col class="col-11" style="padding: 0px">
                  <span
                    style="font: normal normal 490 15px Montserrat; float: left"
                  >
                    I give permission for stratego developers to perform a
                    one-time login to my account, if this is necessary to solve
                    a technical issue.
                  </span>
                </v-col>
              </v-row>
            </div>
          </div>
          <div class="modal-footer">
            <a
              href="#"
              @click="dialog_contact_support = false"
              style="
                font: normal normal 490 16px Montserrat;
                letter-spacing: 0px;
                margin-right: 10px;
                text-decoration: none;
                color: grey;
                font-weight: bolder;
              "
              >Cancel</a
            >
            <button
              type="submit"
              class="submit btn btn-primary"
              style="
                font: normal normal 490 16px Montserrat;
                padding: 8px 12px;
                height: auto;
                background-color: #3499ff;
                border-color: #3499ff;
              "
              @click="send_email"
            >
              Send message
            </button>
          </div>
        </form>
      </div>
    </v-dialog>
    <!-- Editing payinfo -->

    <v-dialog
      v-model="dialog_edit_payment_info"
      transition="dialog-top-transition"
      max-width="600"
    >
      <div class="modal-content">
        <div class="modal-header" style="padding: 30px 30px 15px 30px">
          <h5
            class="modal-title"
            style="
              display: inline-block;
              font-family: 'Montserrat';
              font-size: 20px;
              font-weight: bold;
            "
          >
            Edit payment information
          </h5>
          <button
            type="button"
            class="close"
            @click="dialog_edit_payment_info = false"
          >
            <span aria-hidden="true" style="font-size: 32px">&times;</span>
          </button>
        </div>

        <form id="edit_payinfo" @submit.prevent="store()">
          <div class="modal-body" style="padding: 1rem">
            <div class="form-group">
              <div>
                <v-row>
                  <v-col class="col-5">
                    <v-text-field
                      label="Credit card number"
                      :rules="rules"
                      hide-details="auto"
                      dense
                    ></v-text-field>
                  </v-col>
                  <v-col class="col-4">
                    <v-menu
                      v-model="menu2"
                      :close-on-content-click="false"
                      :nudge-right="40"
                      transition="scale-transition"
                      offset-y
                      min-width="auto"
                    >
                      <template v-slot:activator="{ on, attrs }">
                        <v-text-field
                          v-model="date"
                          label="Expiration date"
                          prepend-icon="mdi-calendar"
                          readonly
                          v-bind="attrs"
                          v-on="on"
                          dense
                          type="month"
                        ></v-text-field>
                      </template>
                      <v-date-picker
                        v-model="date"
                        type="month"
                        @input="menu2 = false"
                      ></v-date-picker>
                    </v-menu>
                  </v-col>
                  <v-col class="col-3">
                    <v-text-field
                      label="CVV"
                      :rules="rules"
                      hide-details="auto"
                      dense
                    ></v-text-field>
                  </v-col>
                </v-row>
                <v-row>
                  <v-col class="col-12">
                    <v-text-field
                      label="Cardholder name"
                      :rules="rules"
                      hide-details="auto"
                      dense
                    ></v-text-field>
                  </v-col>
                </v-row>
                <v-row>
                  <v-col class="col-12">
                    <v-text-field
                      label="Address line 1"
                      :rules="rules"
                      hide-details="auto"
                      dense
                    ></v-text-field>
                  </v-col>
                </v-row>
                <v-row>
                  <v-col class="col-12">
                    <v-text-field
                      label="Address line 2"
                      :rules="rules"
                      dense
                      hide-details="auto"
                    ></v-text-field>
                  </v-col>
                </v-row>
                <v-row>
                  <v-col class="col-6">
                    <v-text-field
                      label="City"
                      :rules="rules"
                      hide-details="auto"
                      dense
                    ></v-text-field>
                  </v-col>
                  <v-col class="col-6">
                    <v-text-field
                      label="Zip / Postal"
                      :rules="rules"
                      dense
                      hide-details="auto"
                    ></v-text-field>
                  </v-col>
                </v-row>
                <v-row>
                  <v-col class="col-6">
                    <v-select
                      v-model="e3"
                      :items="states"
                      menu-props="auto"
                      label="Country"
                      hide-details
                      prepend-icon="mdi-map"
                      dense
                      :rules="rules"
                    ></v-select>
                  </v-col>
                  <v-col class="col-6">
                    <v-text-field
                      label="State / Province"
                      :rules="rules"
                      hide-details="auto"
                      dense
                    ></v-text-field>
                  </v-col>
                </v-row>
              </div>
              <p
                style="
                  font: normal normal 490 15px Montserrat;
                  padding-left: 20px;
                  padding-right: 20px;
                "
              >
                Your privacy is super important to us - we'll only use your
                information as described in our
                <a style="color: #0c95fe; font-weight: bold">terms of use</a>
                and
                <a style="color: #0c95fe; font-weight: bold">Privacy Policy</a>
              </p>
            </div>
          </div>
          <div class="modal-footer">
            <a
              href="#"
              @click="dialog_edit_payment_info = false"
              style="
                font: normal normal 490 16px Montserrat;
                letter-spacing: 0px;
                margin-right: 10px;
                text-decoration: none;
                color: grey;
                font-weight: bolder;
              "
              >Cancel</a
            >
            <button
              type="submit"
              class="submit btn btn-primary"
              style="
                font: normal normal 490 16px Montserrat;
                padding: 8px 12px;
                height: auto;
                background-color: #3499ff;
                border-color: #3499ff;
              "
            >
              Edit payment info
            </button>
          </div>
        </form>
      </div>
    </v-dialog>

    <!-- Closing account -->

    <v-dialog
      v-model="dialog_close_account"
      transition="dialog-top-transition"
      max-width="600"
    >
      <div class="modal-content">
        <div class="modal-header" style="padding: 30px 30px 15px 30px">
          <h5
            class="modal-title"
            style="
              display: inline-block;
              font-family: 'Montserrat';
              font-size: 20px;
              font-weight: bold;
            "
          >
            Close your account
          </h5>
          <button
            type="button"
            class="close"
            @click="dialog_close_account = false"
          >
            <span aria-hidden="true" style="font-size: 32px">&times;</span>
          </button>
        </div>

        <form id="close_account" @submit.prevent="store()">
          <div class="modal-body" style="padding: 2.5rem">
            <div class="form-group" style="margin-top: 10px">
              <span style="font: normal normal 490 15px Montserrat">
                If you close your account, you and your team will not be able to
                access to your plan.
              </span>
            </div>
          </div>
          <div class="modal-footer">
            <a
              href="#"
              @click="dialog_close_account = false"
              data-bs-dismiss="modal"
              style="
                font: normal normal 490 16px Montserrat;
                letter-spacing: 0px;
                margin-right: 10px;
                text-decoration: none;
                color: grey;
                font-weight: bolder;
              "
              >Keep my account</a
            >
            <button
              type="submit"
              class="submit btn btn-primary"
              style="
                font: normal normal 490 16px Montserrat;
                padding: 8px 12px;
                height: auto;
                background-color: #ca1926;
                border-color: #ca1926;
              "
            >
              Close account
            </button>
          </div>
        </form>
      </div>
    </v-dialog>
    <!-- Modals -->
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
      headquarters: [
        "North America",
        "South America",
        "Europe",
        "Asia",
        "Africa",
        "Australia",
      ],
      company_sizes: ["1 ~ 14", "15 ~ 49", "50 ~ 499", "500 ~ 1999", "2000+"],
      title: "",
      email: "",
      sales_rules: {
        required: (value) => !!value || "Required.",
        email: (value) => {
          const pattern =
            /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
          return pattern.test(value) || "Invalid e-mail.";
        },
      },
      user_names: [],
      user_emails: [],
      name_value: null,
      email_value: null,
      billing_contactor: "Carlos Valdés",
      prices: {
        startup: 10,
        scaleup: 25,
      },
      selected: 2,
      plan_type: "1",
      loader: null,
      loading2: false,
      reveal: false,
      rules: [
        (value) => !!value || "Required.",
        (value) => (value && value.length >= 3) || "Min 3 characters",
      ],

      date: new Date().toISOString().substr(0, 7),
      menu2: false,
      e1: "Florida",
      e2: "Texas",
      e3: null,
      e4: null,
      states: [
        "Alabama",
        "Alaska",
        "American Samoa",
        "Arizona",
        "Arkansas",
        "California",
        "Colorado",
        "Connecticut",
        "Delaware",
        "District of Columbia",
        "Federated States of Micronesia",
        "Florida",
        "Georgia",
        "Guam",
        "Hawaii",
        "Idaho",
        "Illinois",
        "Indiana",
        "Iowa",
        "Kansas",
        "Kentucky",
        "Louisiana",
        "Maine",
        "Marshall Islands",
        "Maryland",
        "Massachusetts",
        "Michigan",
        "Minnesota",
        "Mississippi",
        "Missouri",
        "Montana",
        "Nebraska",
        "Nevada",
        "New Hampshire",
        "New Jersey",
        "New Mexico",
        "New York",
        "North Carolina",
        "North Dakota",
        "Northern Mariana Islands",
        "Ohio",
        "Oklahoma",
        "Oregon",
        "Palau",
        "Pennsylvania",
        "Puerto Rico",
        "Rhode Island",
        "South Carolina",
        "South Dakota",
        "Tennessee",
        "Texas",
        "Utah",
        "Vermont",
        "Virgin Island",
        "Virginia",
        "Washington",
        "West Virginia",
        "Wisconsin",
        "Wyoming",
      ],
      pay_mode: false,
      ex_rules: [
        (value) => !!value || "Required.",
        (value) => (value && value.length >= 3) || "Min 3 characters",
      ],
      dialog_continue_edit_button: false,
      dialog_edit_plan: false,
      dialog_continue: false,
      dialog_close_account: false,
      dialog_add_seats: false,
      dialog_remove_seats: false,
      dialog_edit_payment_info: false,
      dialog_contact_support: false,
      ex_date: new Date().toISOString().substr(0, 7),
      ex_menu2: false,
      ex_e1: "Florida",
      ex_e2: "Texas",
      ex_e3: null,
      ex_e4: null,
      ex_states: [
        "Alabama",
        "Alaska",
        "American Samoa",
        "Arizona",
        "Arkansas",
        "California",
        "Colorado",
        "Connecticut",
        "Delaware",
        "District of Columbia",
        "Federated States of Micronesia",
        "Florida",
        "Georgia",
        "Guam",
        "Hawaii",
        "Idaho",
        "Illinois",
        "Indiana",
        "Iowa",
        "Kansas",
        "Kentucky",
        "Louisiana",
        "Maine",
        "Marshall Islands",
        "Maryland",
        "Massachusetts",
        "Michigan",
        "Minnesota",
        "Mississippi",
        "Missouri",
        "Montana",
        "Nebraska",
        "Nevada",
        "New Hampshire",
        "New Jersey",
        "New Mexico",
        "New York",
        "North Carolina",
        "North Dakota",
        "Northern Mariana Islands",
        "Ohio",
        "Oklahoma",
        "Oregon",
        "Palau",
        "Pennsylvania",
        "Puerto Rico",
        "Rhode Island",
        "South Carolina",
        "South Dakota",
        "Tennessee",
        "Texas",
        "Utah",
        "Vermont",
        "Virgin Island",
        "Virginia",
        "Washington",
        "West Virginia",
        "Wisconsin",
        "Wyoming",
      ],
      items: ["Foo", "Bar", "Fizz", "Buzz"],
      sizes: [
        { val: 2, name: "2 seats" },
        { val: 3, name: "3 seats" },
        { val: 5, name: "5 seats" },
        { val: 10, name: "10 seats" },
        { val: 15, name: "15 seats" },
        { val: 20, name: "20 seats" },
        { val: 25, name: "25 seats" },
        { val: 30, name: "30 seats" },
        { val: 40, name: "40 seats" },
        { val: 50, name: "50 seats" },
        { val: 100, name: "100 seats" },
        { val: 200, name: "200+ seats" },
      ],
      stratigo_plans: [
        { val: 2, title: "Standard" },
        { val: 3, title: "Pro" },
      ],
    };
  },
  watch: {
    loader() {
      const l = this.loader;
      this[l] = !this[l];

      setTimeout(() => (this[l] = false), 2000);

      this.loader = null;
    },
  },
  methods: {
    getColor(name) {
      if (
        name.slice(0, 1) == "A" ||
        name.slice(0, 1) == "B" ||
        name.slice(0, 1) == "C" ||
        name.slice(0, 1) == "D" ||
        name.slice(0, 1) == "E" ||
        name.slice(0, 1) == "F"
      )
        return "#3499FF";
      else if (
        name.slice(0, 1) == "G" ||
        name.slice(0, 1) == "H" ||
        name.slice(0, 1) == "I" ||
        name.slice(0, 1) == "J" ||
        name.slice(0, 1) == "K" ||
        name.slice(0, 1) == "L"
      )
        return "#04DB80";
      else if (
        name.slice(0, 1) == "M" ||
        name.slice(0, 1) == "N" ||
        name.slice(0, 1) == "O" ||
        name.slice(0, 1) == "P" ||
        name.slice(0, 1) == "Q" ||
        name.slice(0, 1) == "R"
      )
        return "#FF7701";
      else if (
        name.slice(0, 1) == "S" ||
        name.slice(0, 1) == "T" ||
        name.slice(0, 1) == "U" ||
        name.slice(0, 1) == "V" ||
        name.slice(0, 1) == "W" ||
        name.slice(0, 1) == "X" ||
        name.slice(0, 1) == "Y" ||
        name.slice(0, 1) == "Z"
      )
        return "#FF7701";
    },
    currentDataItems() {
      console.log(
        "currentDataItems",
        this.selected,
        this.pay_mode,
        this.prices.startup,
        this.prices.scaleup
      );
      if (this.pay_mode == true) {
        this.prices.startup = Math.round(this.prices.startup * 0.82);
        this.prices.scaleup = Math.round(this.prices.scaleup * 0.82);
      } else {
        this.prices.startup = 10;
        this.prices.scaleup = 25;
      }
    },
    change_billing_contactor() {
      this.billing_contactor = this.name_value;
    },
    select_billing_contact(type) {
      console.log("name_val", this.name_value, "email_val", this.email_value);
      axios
        .get(
          `/api/billing_contactor?value=${
            type === "email" ? this.email_value : this.name_value
          }&type=${type}`
        )
        .then((res) => {
          console.log("Our user", res);
          this.name_value = res.data[0].name;
          this.email_value = res.data[0].email;
        })
        .catch((err) => {
          console.log("err", err);
        });
    },
    send_email() {
      axios
        .get("/api/send_email", {
          body: JSON.stringify(this.user),
          headers: {
            "content-type": "application/json",
            "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
          },
        })
        .then((res) => res.json())
        .then((data) => {
          console.log("email sent");
        })
        .catch((err) => console.error(err.toString()));
    },
    getUsers() {
      axios
        .get("/api/admin_users")
        .then((res) => {
          console.log(res);
          for (let i = 0; i < res.data.length; i++) {
            this.user_names.push(res.data[i].name);
            this.user_emails.push(res.data[i].email);
          }
          console.log(this.user_names, " AND ", this.user_emails);
        })
        .catch((err) => {
          console.log("err", err);
        });
    },
  },
  mounted() {
    // Get Users
    this.getUsers();
  },
};
</script> 

<style scoped>
.v-card--reveal {
  bottom: 0;
  opacity: 1 !important;
  position: absolute;
  width: 100%;
}
.billing_content {
  margin-left: 440px;
  margin-top: 5px;
  margin-right: 26px;
}
svg {
  margin-left: 26px;
  margin-bottom: 5px;
}
.v-input--checkbox {
  margin: 0px;
}
.subtitle {
  font-family: "Montserrat";
  font-size: 18px;
  font-weight: bold;
}
span {
  font-family: "Montserrat";
  font-size: 16px;
  font-weight: bold;
  letter-spacing: 0;
  margin-bottom: 5px;
}
.v-bottom-navigation {
  display: block !important;
}
.v-btn--text {
  max-width: 500px !important;
}
img {
  visibility: inherit !important;
  width: 35px;
  margin-left: 26px;
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
  font-size: 20px;
  font-weight: bolder;
}
.my_btn {
  color: #3499ff;
}
.error_box {
  margin-right: 18.5vw !important;
  margin-left: 9.5vw !important;
}
.success_box {
  margin-left: 17.5vw !important;
}
.info_box {
  margin-left: 17.5vw !important;
}
.v-application .pa-2 {
  padding: 0px !important;
}
.custom-loader {
  animation: loader 1s infinite;
  display: flex;
}
</style>