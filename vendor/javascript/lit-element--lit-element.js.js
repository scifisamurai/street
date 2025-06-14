// lit-element/lit-element.js@4.2.0 downloaded from https://ga.jspm.io/npm:lit-element@4.2.0/lit-element.js

import{ReactiveElement as e}from"@lit/reactive-element";export*from"@lit/reactive-element";import{render as t,noChange as n}from"lit-html";export*from"lit-html";
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */const r=globalThis;class i extends e{constructor(){super(...arguments),this.renderOptions={host:this},this._$Do=void 0}createRenderRoot(){const e=super.createRenderRoot();return this.renderOptions.renderBefore??=e.firstChild,e}update(e){const n=this.render();this.hasUpdated||(this.renderOptions.isConnected=this.isConnected),super.update(e),this._$Do=t(n,this.renderRoot,this.renderOptions)}connectedCallback(){super.connectedCallback(),this._$Do?.setConnected(!0)}disconnectedCallback(){super.disconnectedCallback(),this._$Do?.setConnected(!1)}render(){return n}}i._$litElement$=!0,i.finalized=!0,r.litElementHydrateSupport?.({LitElement:i});const o=r.litElementPolyfillSupport;o?.({LitElement:i});const s={_$AK:(e,t,n)=>{e._$AK(t,n)},_$AL:e=>e._$AL};(r.litElementVersions??=[]).push("4.2.0");export{i as LitElement,s as _$LE};

