export default [

    { path: '/dashboard', component: require('./components/Teams/Dashboard.vue').default },
    { path: '/headingbar', component: require('./components/Headingbar.vue').default },
    { path: '/goals_main', component: require('./components/Goals/Goals_main.vue').default },

    { path: '/admin_users', component: require('./components/Admin/Admin.vue').default },
    { path: '/billing', component: require('./components/Admin/Billing.vue').default },
    { path: '/rescources', component: require('./components/Admin/Rescources.vue').default },
    { path: '/usage_stats', component: require('./components/Admin/UsageStats.vue').default },
    { path: '/profile', component: require('./components/Profile.vue').default },
    { path: '/users', component: require('./components/Users.vue').default },
    { path: '*', component: require('./components/NotFound.vue').default }
];
