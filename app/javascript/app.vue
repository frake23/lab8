<template>
  <div class="container my-4">
    <main-form :on-form-submit="onFormSubmit"/>
    <distances-view :distances="distances" :max-distance="maxDistance" v-if="distances" :initial="initial"/>
  </div>
</template>

<script>
import MainForm from "./components/MainForm";
import DistancesView from "./components/DistancesView";
export default {
  components: {DistancesView, MainForm},
  data: () => {
    return {
      distances: null,
      maxDistance: null,
      initial: null
    }
  },
  methods: {
    onFormSubmit(s) {
      fetch('/', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({arr: s})
      })
        .then((res) => res.text())
        .then((text) => {
          const json = JSON.parse(text);
          if (json.error) return alert(json.error);

          this.initial = s;
          this.distances = json.distances;
          this.maxDistance = json.maxDistance
        })
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
