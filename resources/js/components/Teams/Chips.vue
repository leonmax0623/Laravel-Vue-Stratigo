<template>
  <div class="modal-content" style="width: 115% !important">
    <div class="modal-header">
      <h5
        class="modal-title"
        style="
          display: inline-block;
          font: normal normal 600 16px/26px Montserrat;
        "
      >
        Add field
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

    <form id="addunitForm" @submit.prevent="addfiled()">
      <div class="modal-body" style="padding: 2rem !important">
        <div style="display: flex">
          <div
            class="form-group"
            style="width: 63%; padding-right: 23px !important"
          >
            <label style="font: normal normal 490 13px Montserrat"
              >Field title</label
            >
            <input
              type="text"
              id="field_name"
              class="form-control"
              autocomplete="off"
            />
          </div>
          <div class="form-group" style="width: 30%">
            <label style="font: normal normal 490 13px Montserrat"
              >Field title</label
            >

            <select
              id="field"
              data-show-content="true"
              class="form-control"
              @click="create_field"
            >
              <option>
                <i class="fa fa-caret-down" aria-hidden="true"></i>
                Dropdown
              </option>
              <option>Text</option>
              <option>Numbers</option>
              <option>Status</option>
              <option>Date</option>
              <option>People</option>
              <option>Files</option>
              <option>Progress</option>
              <option>Timeline</option>
              <option>Tags</option>
              <option>Checkbox</option>
              <option>Creation log</option>
              <option>Last update</option>
            </select>
          </div>
        </div>
        <div id="dropdown" class="form-group d-none" style="width: 93%">
          <v-text-field class="text" v-model="message1" clearable>
            ></v-text-field
          >
          <v-text-field class="text" v-model="message2" clearable>
            ></v-text-field
          >
          <a href="#">+Add an option</a>
        </div>
      </div>
      <div class="modal-footer" style="border-top: 0px">
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
          Create Field
        </button>
      </div>
    </form>
  </div>
</template>

<style>
.text {
  height: 35px;
  padding-top: 0px;
  margin-top: 0px;
}
</style>

<script>
export default {
  data() {
    return {
      message1: "Option 1",
      message2: "Option 2",
      message3: "Option 3",
      message4: "Option 4",
    };
  },
  methods: {
    create_field() {
      var data = $("#field").val();
      if (data == "Dropdown") {
        console.log("|");
        // $("#Dropdown").toggleClass("d-none");
        $("#Dropdown").addClass("d-show");
      }
    },
  },
};
</script>

