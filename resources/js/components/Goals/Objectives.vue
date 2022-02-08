<template>
  <div >
       <div class="head">
          <span>Q1 2021</span>
          <i class="fa fa-chevron-left" aria-hidden="true"></i>
          <span>Q2 2021</span>
          <i class="fa fa-chevron-right" aria-hidden="true"></i>
          <span>Q3 2021</span>
            
      </div>
      <br />
    
    <div class="form-group" style="margin-bottom: 0px">
      <a href="#" @click="add_goal" style="font-size: 12px; padding-left: 35px"
        >+Add goal</a
      >
    </div>
    <div id="add_goal" class="d-show object">
        <img src="../../img/goal.svg">
        <span> The objective of </span>
        <select id="objective" v-model="objective" class="sel form-control fa">
        <option class="fa" value="0">
            &#xf0c0
            <img style="" src="../../img/goals.png" />{{ team_name }}
        </option>
        <option value="1"><span class="badge badge-primary badge-pill">
                        {{ user_name | short_hand }}
                    </span>-{{ user_name }}</option>
        </select>
        <span>is to </span>
        <input type="text" class="txt form-control" placeholder="sell">
        <select v-model="than" class="form-control sel" name="" id="">
            <option value="0"> more than</option>
            <option value="1">less than</option>
            <option value="2">exactly</option>
        </select>
        <div v-if="objective == 0" style="display:inline">
          <input  type="text" class="txt form-control" placeholder="$100,000">
          <input type="text" class="txt form-control" placeholder="of product A">
        </div>
        <div v-else style="display:inline">
            <input type="text" class="form-control" style="width:100px;display:inline" placeholder="$100,000">
            <input type="text" class="form-control" style="width:40px;display:inline" placeholder="in">
            <input type="text" class="txt form-control inline" placeholder="of business A">
        </div>
           <span v-if="week==1"> in the initial </span>
         <select v-model="week" class="form-control sel" name="" id="">
            <option value="0"> weekly</option>
            <option value="1">week</option>
            <option value="2">daily</option>
        </select>
        <div v-if="week==1" style="display:inline">
            <span> and in the last week</span>
            <input type="text" class="form-control inline" style="width:100px" placeholder="$80,000">
        </div>
        <div v-else-if="week==2" class="inline">
          <div v-for='(day,i) in daily' :key="i" class="inline">
            <button @click="day_click(i)" :id="i" class="inline btn btn-outline-primary">{{day}}</button>
          </div>
        </div>
        <span v-if="than==0"> , being red less than </span>
        <span v-else-if="than==1"> , being red more than </span>
        <span v-else> , being red more or less than </span>
        <input type="text" class="txt form-control inline" placeholder="$80,000">
        <div v-if="week==1" style="display:inline">
            <span> in the initial week and in the last week</span>
            <input type="text" class="form-control inline" style="width:100px" placeholder="$90,000">
        </div>
        <span> in Q2 2021.</span>
        <br />
        <span>The objective is fixed or variable during the quarter?</span>
        <select name="" id="" class="form-control sel">
            <option> Fixed</option>
            <option> Variable </option>
        </select>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    goalData: { type: Object },
  },
  data() {
    return {
      index: 0,
      than: 0,
      week: 0,
      objective: 0,
      team_name: "",
      user_name: "",
      daily: ["M", "Tu", "W", "Th", "F", "Sa", "Su"],
    };
  },
  methods: {
    loadteam() {
      axios
        .get("/api/goals/getteamname", {
          params: {
            team_id: this.goalData.team_id,
            user_id: this.goalData.user_id,
          },
        })
        .then(({ data }) => {
          this.team_name = data.data.teamname.name;
          this.user_name = data.data.username.name;
        });
    },
    product() {
      // var product = $("#objective").val();
      // this.objective = product;
      console.log("objective:", this.objective);
      this.$forceUpdate();
    },
    add_goal() {
      this.index++;
      if (this.index % 2 == 0) {
        $("#add_goal").removeClass("d-none");
        $("#add_goal").addClass("d-show");
      } else {
        $("#add_goal").removeClass("d-show");
        $("#add_goal").addClass("d-none");
      }
    },
    day_click(i) {
      $("#" + i).toggleClass("active");
    },
  },
  watch: {
    goalData(newValue) {
      this.loadteam();
    },
  },
  created() {
    const $this = this;
    setTimeout(function () {
      $this.loadteam();
    }, 100);
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

<style>
.sel {
  width: auto;
  display: inline;
}
.txt {
  display: inline;
  width: 150px;
}
.inline {
  display: inline;
}
.object {
  padding-left: 25px;
}
.head {
  text-align: center;
}
</style>