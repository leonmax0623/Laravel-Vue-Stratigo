<template>
  <div>
    <div>
      <div class="dropdown d-inline-block" style="display: flex !important">
        <a
          href="#"
          class="dropdown-toggle"
          id="dropdownMenuButton"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
          v-if="!teamid"
        >
          <h2>
            <img src="../img/unity.png" style="width: 15px" />
            {{ unitData && unitData.unit_name }}
            <i class="fa fa-chevron-down" aria-hidden="true"></i>
          </h2>
        </a>
        <a v-if="teamid" href="#">
          <h2>
            <img src="../img/unity.png" style="width: 15px" />
            {{ unitData && unitData.unit_name }}
            <i class="fa fa-chevron-right" aria-hidden="true"></i>
          </h2>
        </a>
        <a
          href="#"
          class="dropdown-toggle"
          id="dropdownMenuButton"
          data-toggle="dropdown"
          aria-haspopup="true"
          aria-expanded="false"
          v-if="teamid"
        >
          <i
            class="fa fa-users to"
            aria-hidden="true"
            style="font-size: 17px"
          ></i>
          {{ teamData && teamData.name }}
          <i class="fa fa-chevron-down" aria-hidden="true"></i>
        </a>
        <div
          class="dropdown-menu dropdownMenuButton"
          aria-labelledby="dropdownMenuButton"
        >
          <a class="dropdown-item" href="#" @click="editUnitModal"
            ><i class="fas fa-pencil-alt" style="margin-right: 5px"></i>
            <span style="font-family: 'Spartan', sans-serif"
              >Edit unit details</span
            ></a
          >
          <a class="dropdown-item" href="#" @click="duplicateModal"
            ><i class="fas fa-copy" style="margin-right: 5px"></i>
            <span style="font-family: 'Spartan', sans-serif">Duplicate</span></a
          >
          <a
            class="dropdown-item"
            href="javascript::void(0);"
            onclick="event.preventDefault();
                        document.getElementById('export-csv').submit();"
          >
            <i class="fas fa-print" style="margin-right: 5px"></i>
            <span style="font-family: 'Spartan', sans-serif">Export CSV</span>
          </a>
          <a class="dropdown-item" href="#"
            ><i class="fas fa-print" style="margin-right: 5px"></i>
            <span style="font-family: 'Spartan', sans-serif"
              >Export PDF</span
            ></a
          >
          <a class="dropdown-item" href="#"
            ><i class="fas fa-archive" style="margin-right: 5px"></i>
            <span style="font-family: 'Spartan', sans-serif">Archive</span></a
          >
          <a
            class="dropdown-item"
            @click="deleteProduct"
            href="#"
            style="color: #d7525c"
            ><i class="fas fa-trash" style="margin-right: 5px"></i>
            <span style="font-family: 'Spartan', sans-serif">Delete</span></a
          >
        </div>

        <i class="far fa-star mx-1" aria-hidden="true"></i>
        <a href="#" class="h6"
          ><i class="fa fa-circle text-success" aria-hidden="true"></i> On
          Track</a
        >
      </div>
    </div>
    <div>
      <div
        class="modal fade"
        id="editUnitModal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="editUnitModal"
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
                Edit Unit
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

            <form id="editUnitForm" @submit.prevent="update()">
              <div class="modal-body" style="padding-top: 0">
                <div class="form-group">
                  <label style="font: normal normal 490 11px Montserrat"
                    >Name of the unit:</label
                  >
                  <input
                    type="text"
                    name="unit_name"
                    v-model="unitform.unit_name"
                    class="form-control"
                    style="border-radius: 2px; margin-top: 5px"
                    autocomplete="off"
                    :class="{ 'is-invalid': unitform.errors.has('name') }"
                  />
                  <has-error :form="unitform" field="name"></has-error>
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
                  Update
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

            <form id="duplicateUnitForm" @submit.prevent="duplicate()">
              <div class="modal-body" style="padding-top: 0">
                <div class="form-group">
                  <label style="font: normal normal 490 11px Montserrat"
                    >Rename of the unit:</label
                  >
                  <input
                    type="text"
                    name="unit_name"
                    v-model="unitform.unit_name"
                    class="form-control"
                    style="border-radius: 2px; margin-top: 5px"
                    autocomplete="off"
                    :class="{ 'is-invalid': unitform.errors.has('name') }"
                  />
                  <has-error :form="unitform" field="name"></has-error>
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
  </div>
</template>
<style>
.d-show {
  display: show;
}
.d-none {
  display: none;
}
</style>

<script>
import Teams from "./Teams/Teams.vue";
export default {
  components: {
    Teams,
  },
  data() {
    return {
      visible: 0,
      editmode: false,
      unitform: new Form({
        id: "",
        unit_name: "",
      }),
    };
  },
  props: {
    unitData: { type: Object },
    id: { type: Number },
    teamid: { type: Number },
    teamData: { type: Object },
    updateUnit: { type: Function },
    duplicateUnit: { type: Function },
  },
  methods: {
    update() {
      this.updateUnit(this.unitform);
    },
    duplicate() {
      this.duplicateUnit(this.unitform);
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
};
</script>