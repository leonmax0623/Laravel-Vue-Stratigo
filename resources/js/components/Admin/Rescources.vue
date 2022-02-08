<template>
  <v-app class="main-frame">
    <Layout />
    <div
      class="main-contents"
      style="
        width: calc(100vw - 105px);
        left: 105px;
        margin-top: 50px;
        text-align: center;
      "
    >
      <p
        style="font-size: 52px; font-weight: bolder; font-family: 'Montserrat'"
      >
        This Section Requires Admin Privileges.
      </p>
      <p
        style="font-size: 21px; font-weight: bolder; font-family: 'Montserrat'"
      >
        You need to be a member of the Admin Team to access this page. <br />
        You can ask the following people for access:
      </p>
      <span class="detail"
        ><v-avatar color="#3499FF" size="36" style="margin-right: 10px">
          <span class="white--text" style="font-size: 20px">Jo</span> </v-avatar
        >José Luis de la Fuente</span
      >
    </div>
  </v-app>
</template>

<script>
import Layout from ".././Layout.vue";
export default {
  components: {
    Layout,
  },
  data() {
    return {
      skill: 20,
      knowledge: 33,
      power: 78,
    };
  },
};
</script> 

<style scoped>
</style>