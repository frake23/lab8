<template>
  <div class="container my-4">
    <div class="d-flex justify-content-end mb-4">
      <button class="btn btn-danger" v-on:click="onHistoryShow">История</button>
    </div>
    <history-view :results="results" v-if="showHistory"/>

    <main-form :on-form-submit="onFormSubmit"/>
    <distances-view :distances="distances" :max-distance="maxDistance" v-if="distances" :initial="initial"/>
  </div>
</template>

<script>
import MainForm from "./components/MainForm";
import DistancesView from "./components/DistancesView";
import HistoryView from "./components/HistoryView";

export default {
  components: {HistoryView, DistancesView, MainForm},
  data: () => {
    return {
      distances: null,
      maxDistance: null,
      initial: null,
      showHistory: false,
      results: []
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
          this.distances = json.distances.map(i => i.distance);
          this.maxDistance = json['max_distance']
        })
        .then(() => this.fetchHistory())
    },
    onHistoryShow() {
      this.showHistory = !this.showHistory;
      console.log(this.results)
    },
    fetchHistory() {
      fetch('/history')
          .then(res => res.text())
          .then(text => {
            this.results = JSON.parse(text);
          })
    }
  },
  mounted() {
    this.fetchHistory();
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
