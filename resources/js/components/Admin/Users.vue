<template>
  <v-app class="main-contents" style="width: calc(100vw - 427px)">
    <div class="title" style="height: 100px">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="25px"
        height="20px"
        viewBox="0 0 15.506 18.586"
        style="margin-bottom: 7px; margin-left: 28px"
      >
        <path
          d="M91.508,8.953a4.332,4.332,0,0,0,3.165-1.311,4.332,4.332,0,0,0,1.311-3.165,4.332,4.332,0,0,0-1.311-3.165,4.475,4.475,0,0,0-6.33,0,4.331,4.331,0,0,0-1.311,3.165,4.332,4.332,0,0,0,1.311,3.165A4.333,4.333,0,0,0,91.508,8.953ZM89.113,2.082a3.386,3.386,0,0,1,4.79,0A3.236,3.236,0,0,1,94.9,4.476,3.236,3.236,0,0,1,93.9,6.871a3.386,3.386,0,0,1-4.79,0,3.236,3.236,0,0,1-.993-2.395,3.236,3.236,0,0,1,.993-2.395Zm0,0"
          transform="translate(-83.872 0)"
        />
        <path
          d="M15.468,252.63a11.057,11.057,0,0,0-.151-1.174,9.253,9.253,0,0,0-.289-1.181,5.833,5.833,0,0,0-.486-1.1,4.151,4.151,0,0,0-.732-.954,3.227,3.227,0,0,0-1.051-.661,3.634,3.634,0,0,0-1.342-.243,1.362,1.362,0,0,0-.728.309c-.218.142-.473.307-.758.489a4.342,4.342,0,0,1-.981.432,3.808,3.808,0,0,1-2.4,0,4.33,4.33,0,0,1-.98-.432c-.282-.18-.537-.345-.759-.489a1.361,1.361,0,0,0-.727-.309,3.629,3.629,0,0,0-1.342.243,3.224,3.224,0,0,0-1.052.661,4.152,4.152,0,0,0-.732.954,5.844,5.844,0,0,0-.485,1.1,9.274,9.274,0,0,0-.289,1.181,10.982,10.982,0,0,0-.151,1.175c-.025.355-.037.724-.037,1.1a3.086,3.086,0,0,0,.917,2.335,3.3,3.3,0,0,0,2.362.861h8.949a3.3,3.3,0,0,0,2.362-.861,3.085,3.085,0,0,0,.917-2.335c0-.374-.013-.744-.038-1.1Zm-1.63,2.644a2.221,2.221,0,0,1-1.611.561H3.278a2.221,2.221,0,0,1-1.611-.561,2.015,2.015,0,0,1-.578-1.546c0-.348.011-.692.034-1.022a9.906,9.906,0,0,1,.136-1.058,8.18,8.18,0,0,1,.254-1.041,4.757,4.757,0,0,1,.4-.9,3.078,3.078,0,0,1,.538-.7,2.141,2.141,0,0,1,.7-.435A2.506,2.506,0,0,1,4,248.407c.038.02.106.059.216.131.224.146.482.312.767.495a5.4,5.4,0,0,0,1.231.55,4.9,4.9,0,0,0,3.069,0,5.4,5.4,0,0,0,1.232-.55c.292-.187.543-.348.767-.494.11-.072.178-.11.216-.131a2.508,2.508,0,0,1,.858.165,2.144,2.144,0,0,1,.7.435,3.069,3.069,0,0,1,.538.705,4.742,4.742,0,0,1,.4.9,8.162,8.162,0,0,1,.254,1.041,9.989,9.989,0,0,1,.136,1.058h0c.023.329.035.673.035,1.022a2.015,2.015,0,0,1-.579,1.546Zm0,0"
          transform="translate(0 -238.339)"
        />
      </svg>
      <span
        style="font-family: 'Montserrat'; font-size: 22px; font-weight: bolder"
        >Users</span
      >
    </div>
    <v-card class="data_table" data-app>
      <v-card-title>
        <v-col cols="3">
          <v-text-field
            v-model="search"
            append-icon="mdi-magnify"
            label="Search by name or email"
            hide-details
          ></v-text-field>
        </v-col>
        <v-col class="d-flex" cols="2" style="margin-top: 20px">
          <v-select
            v-model="user_type"
            :items="types"
            label="User type"
            item-value="val"
            @change="searchUsers()"
          ></v-select>
        </v-col>
        <v-col class="d-flex" cols="1" style="margin-top: 20px">
          <v-select
            v-model="user_status"
            :items="status"
            label="Status"
            @change="searchUsers()"
          ></v-select>
        </v-col>
      </v-card-title>
      <v-data-table :headers="headers" :items="users" :search="search">
        <template v-slot:[`item.name`]="{ item }">
          <v-avatar :color="getColor(item.name)" size="36">
            {{ item.name.slice(0, 2) }}
          </v-avatar>
          {{ item.name }}
        </template>
        <template v-slot:[`item.created_at`]="{ item }">
          {{ getFormatDate(item.created_at) }}
        </template>
        <template v-slot:[`item.updated_at`]="{ item }">
          {{ getFormatDate(item.updated_at) }}
        </template>
        <template v-slot:[`item.loading`]="{ item }">
          <v-menu transition="slide-x-transition" bottom right>
            <template v-slot:activator="{ on, attrs }">
              <img
                v-bind="attrs"
                v-on="on"
                src="./../../img/loading.gif"
                style="width: 90px; height: 60px"
              />
            </template>

            <v-list style="cursor: pointer">
              <v-list-item v-for="(option, i) in options" :key="i">
                <v-list-item-title @click="make_option(item, option.title)">{{
                  option.title
                }}</v-list-item-title>
              </v-list-item>
            </v-list>
          </v-menu>
        </template>
      </v-data-table>
    </v-card>
  </v-app>
</template>

<script>
import loading from "./../../img/loading.gif";
import moment from "moment";
export default {
  components: {
    loading,
  },

  data() {
    return {
      options: [
        { title: "Make Admin" },
        { title: "Remove Admin" },
        { title: "Remove" },
      ],
      user_status: "All",
      user_type: "All",
      status: ["All", "Active", "Pending", "Inactive"],
      types: ["All", "Admin", "Planner", "Collaborator", "Viewer", "Observer"],
      search: "",
      headers: [
        {
          text: "Name",
          align: "center",
          value: "name",
        },
        { text: "Email", value: "email", align: "center" },
        { text: "User Type", value: "type", align: "center" },
        { text: "Status", value: "status", align: "center" },
        { text: "Joined", value: "created_at", align: "center" },
        { text: "Invited By", value: "invited_by", align: "center" },
        { text: "Last Activity", value: "updated_at", align: "center" },
        { text: "Setting", value: "loading", align: "center" },
      ],
      users: [],
    };
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
    getUsers() {
      axios
        .get("/api/admin_users")
        .then((res) => {
          console.log(res);
          this.users = res.data;
        })
        .catch((err) => {
          console.log("err", err);
        });
    },
    searchUsers() {
      console.log("Status", this.user_status, "Type", this.user_type);
      if (this.user_type == "All" && this.user_status == "All") {
        axios
          .get("/api/admin_users")
          .then((res) => {
            console.log(res);
            this.users = res.data;
          })
          .catch((err) => {
            console.log("err", err);
          });
      } else {
        axios
          .get(
            "/api/admin_users_by?user_status=" +
              this.user_status +
              "&user_type=" +
              this.user_type
          )
          .then((res) => {
            console.log(res);
            this.users = res.data;
          })
          .catch((err) => {
            console.log("err", err);
          });
      }
    },
    make_option(selected_user, selected_option) {
      const $this = this;
      console.log(
        "selected user",
        selected_user,
        "selected_option",
        selected_option
      );
      axios
        .post("/api/admin_users_options/" + selected_user.id, {
          selected_option: selected_option,
        })
        .then((res) => {
          console.log(res);
          // this.users = res.data;
        })
        .catch((err) => {
          console.log("err", err);
        });
    },
    getFormatDate(date) {
      return moment(String(date)).format("ll");
    },
  },

  mounted() {
    // Get Users
    this.getUsers();
  },
};
</script> 

<style lang="scss" scoped>
.v-avatar {
  color: white;
  margin-left: 23px;
  margin-right: 10px;
}
.main-contents {
  left: 415px;
  margin-right: 400px;
  margin-top: 14px;
}
.data_table {
  box-shadow: none !important;
}
.title {
  font-size: 22px;
  font-weight: bolder;
  margin-bottom: -40px;
}
.v-card__title {
  padding-left: 17px;
  height: 115px;
  margin-top: -60px !important;
}
.v-input__control {
  margin-bottom: 21px;
}
.v-list {
  margin-right: 0px !important;
}
</style>