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
    onFormSubmit(data) {
      this.initial = data;
      fetch('/', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
      })
        .then((res) => res.text())
        .then((text) => {
          const json = JSON.parse(text);
          this.distances = json.distances;
          console.log(json)
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
