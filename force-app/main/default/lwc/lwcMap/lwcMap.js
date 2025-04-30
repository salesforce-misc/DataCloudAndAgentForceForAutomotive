import { api, LightningElement } from 'lwc';
import { loadScript, loadStyle } from 'lightning/platformResourceLoader';
import LEAFLET from '@salesforce/resourceUrl/Leaflet';
export default class LwcMap extends LightningElement {
   
    @api recordId;
    @api height=400;
    @api hLat
    @api hLong
    @api cLat
    @api cLong
    locations=[]
    

    renderedCallback() {
        this.template.querySelector('div').style.height = `${this.height}px`;
    }
		
    connectedCallback() {
        Promise.all([
            loadStyle(this, LEAFLET + '/leaflet.css'),
            loadScript(this, LEAFLET + '/leaflet.js'),
        ]).then(() => {
            // Leaflet should be ready, create a new draw method
            this.draw();
        });
    }
    draw() {

        let container = this.template.querySelector('div');
        let map = L.map(container, { scrollWheelZoom: false }).setView([this.hLat, this.hLong], 4);
    
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
            maxZoom: 18
        }).addTo(map);
    
        // Define an array of positions
        let positions = [
            [this.cLat, this.cLong],
            [this.hLat, this.hLong],
            // Add more positions as needed
        ];

        console.log('positions',positions);
    
        // Loop through the array and add each position as a marker
        positions.forEach(position => {
            L.marker(position).addTo(map);
        });
    
        // Optionally, fit the map to the bounds of all markers
        let featureGroup = L.featureGroup(positions.map(pos => L.marker(pos))).addTo(map);
        map.fitBounds(featureGroup.getBounds());
       
            
    }

}