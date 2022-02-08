<template>
  <div class="main-frame">
    <Layout />
    <SideBar />
    <Users />
  </div>
</template>
<script>
import Layout from ".././Layout.vue";
import SideBar from "./SideBar.vue";
import Users from "./Users.vue";
export default {
  components: {
    Layout,
    SideBar,
    Users,
  },
};
</script>