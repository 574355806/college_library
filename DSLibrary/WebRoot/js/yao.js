var YAO = function(){
	var D = document, OA = '[object Array]', FC = "[object Function]", OP = Object.prototype, nt = "nodeType", listeners = [], webkitKeymap = {
		63232: 38, // up
		63233: 40, // down
		63234: 37, // left
		63235: 39, // right
		63276: 33, // page up
		63277: 34, // page down
		25: 9 // SHIFT-TAB (Safari provides a different key code in
	}, patterns = {
		HYPHEN: /(-[a-z])/i,
		ROOT_TAG: /body|html/i
	}, lastError = null;
	
	return {
		isArray: function(obj){
			return OP.toString.apply(obj) === OA;
		},
		isString: function(s){
			return typeof s === 'string';
		},
		isBoolean: function(b){
			return typeof b === 'boolean';
		},
		isFunction: function(func){
			return OP.toString.apply(func) === FC;
		},
		isNull: function(obj){
			return obj === null;
		},
		isNumber: function(num){
			return typeof num === 'number' && isFinite(num);
		},
		isObject: function(str){
			return (str && (typeof str === "object" || this.isFunction(str))) || false;
		},
		isUndefined: function(obj){
			return typeof obj === 'undefined';
		},
		hasOwnProperty: function(obj, prper){
			if (OP.hasOwnProperty) {
				return obj.hasOwnProperty(prper);
			}
			return !this.isUndefined(obj[prper]) && obj.constructor.prototype[prper] !== obj[prper];
		},
		isMobile: function(mobile){
			return /^(13|15|18)\d{9}$/.test(YAO.trim(mobile));
		},
		isName: function(name){
			return /^[\w\u4e00-\u9fa5]{1}[\w\u4e00-\u9fa5 \.]{0,19}$/.test(YAO.trim(name));
		},
		
        keys: function(obj){
            var b = [];
            for (var p in obj) {
                b.push(p);
            }
            return b;
        },
        values: function(obj){
            var a = [];
            for (var p in obj) {
                a.push(obj[p]);
            }
            return a;
        },
        isXMLDoc: function(obj){
            return obj.documentElement && !obj.body || obj.tagName && obj.ownerDocument && !obj.ownerDocument.body;
        },
        formatNumber: function(b, e){
            e = e || '';
            b += '';
            var d = b.split('.');
            var a = d[0];
            var c = d.length > 1 ? '.' + d[1] : '';
            var f = /(\d+)(\d{3})/;
            while (f.test(a)) {
                a = a.replace(f, '$1,$2');
            }
            return e + a + c;
        },
        unformatNumber: function(a){
            return a.replace(/([^0-9\.\-])/g, '') * 1;
        },
        stringBuffer: function(){
            var a = [];
            for (var i = 0; i < arguments.length; ++i) {
                a.push(arguments[i]);
            }
            return a.join('');
        },
        trim: function(str){
            try {
                return str.replace(/^\s+|\s+$/g, '');
            } 
            catch (a) {
                return str;
            }
        },
        stripTags: function(str){
            return str.replace(/<\/?[^>]+>/gi, '');
        },
        stripScripts: function(str){
            return str.replace(/<script[^>]*>([\\S\\s]*?)<\/script>/g, '');
        },
        isJSON: function(obj){
            obj = obj.replace(/\\./g, '@').replace(/"[^"\\\n\r]*"/g, '');
            return (/^[,:{}\[\]0-9.\-+Eaeflnr-u \n\r\t]*$/).test(obj);
        },
        encodeHTML: function(str){
            return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
        },
        decodeHTML: function(str){
            return str.replace(/&amp;/g, '&').replace(/&lt;/g, '<').replace(/&gt;/g, '>');
        },
		toCamel: function(property){
			if (!patterns.HYPHEN.test(property)) {
				return property;
			}
			if (propertyCache[property]) {
				return propertyCache[property];
			}
			var converted = property;
			while (patterns.HYPHEN.exec(converted)) {
				converted = converted.replace(RegExp.$1, RegExp.$1.substr(1).toUpperCase());
			}
			propertyCache[property] = converted;
			return converted;
		},
		 
        Cookie: {
            set: function(g, c, f, b){
                var e = new Date();
                var a = new Date();
                if (f == null || f == 0) {
                    f = 1;
                }
                a.setTime(e.getTime() + 3600000 * 24 * f);
                D.cookie = g + '=' + encodeURI(c) + ';expires=' + a.toGMTString() + ';domain=' + b + '; path=/';
            },
            get: function(e){
                var b = D.cookie;
                var d = e + '=';
                var c = b.indexOf('; ' + d);
                if (c == -1) {
                    c = b.indexOf(d);
                    if (c != 0) {
                        return null;
                    }
                }
                else {
                    c += 2;
                }
                var a = D.cookie.indexOf(';', c);
                if (a == -1) {
                    a = b.length;
                }
                return decodeURI(b.substring(c + d.length, a));
            },
            clear: function(b, a){
                if (this.get(b)) {
                    D.cookie = b + '=' + ((domain) ? '; domain=' + a : '') + '; expires=Thu, 01-Jan-70 00:00:01 GMT';
                }
            }
        },
		
		ua: function(){
			var C = {
				ie: 0,
				opera: 0,
				gecko: 0,
				webkit: 0,
				mobile: null,
				air: 0,
				caja: 0
			}, B = navigator.userAgent, A;
			if ((/KHTML/).test(B)) {
				C.webkit = 1;
			}
			A = B.match(/AppleWebKit\/([^\s]*)/);
			if (A && A[1]) {
				C.webkit = parseFloat(A[1]);
				if (/ Mobile\//.test(B)) {
					C.mobile = 'Apple';
				}
				else {
					A = B.match(/NokiaN[^\/]*/);
					if (A) {
						C.mobile = A[0];
					}
				}
				A = B.match(/AdobeAIR\/([^\s]*)/);
				if (A) {
					C.air = A[0];
				}
			}
			if (!C.webkit) {
				A = B.match(/Opera[\s\/]([^\s]*)/);
				if (A && A[1]) {
					C.opera = parseFloat(A[1]);
					A = B.match(/Opera Mini[^;]*/);
					if (A) {
						C.mobile = A[0];
					}
				}
				else {
					A = B.match(/MSIE\s([^;]*)/);
					if (A && A[1]) {
						C.ie = parseFloat(A[1]);
					}
					else {
						A = B.match(/Gecko\/([^\s]*)/);
						if (A) {
							C.gecko = 1;
							A = B.match(/rv:([^\s\)]*)/);
							if (A && A[1]) {
								C.gecko = parseFloat(A[1]);
							}
						}
					}
				}
			}
			A = B.match(/Caja\/([^\s]*)/);
			if (A && A[1]) {
				C.caja = parseFloat(A[1]);
			}
			return C;
		}(),
		
        extend: function(subClass, superClass, override){
            if (!superClass || !subClass) {
                throw new Error('extend failed, please check that all dependencies are included.');
            }
            var F = function(){};
            F.prototype = superClass.prototype;
            subClass.prototype = new F();
            subClass.prototype.constructor = subClass;
            subClass.superclass = superClass.prototype;
            if (superClass.prototype.constructor == Object.prototype.constructor) {
                superClass.prototype.constructor = superClass;
            }
            if (override) {
                for (var p in override) {
                    subClass.prototype[p] = override[p];
                }
            }
        },
        augmentProto: function(sub, sup){
            if (!sub || !sup) {
                throw new Error('augment failed, please check that all dependencies are included.');
            }
            var d = sub.prototype, g = sup.prototype, b = arguments, c, h;
            if (b[2]) {
                for (c = 2; c < b.length; c += 1) {
                    d[b[c]] = g[b[c]];
                }
            }
            else {
                for (h in g) {
                    if (!d[h]) {
                        d[h] = g[h];
                    }
                }
            }
        },
        augmentObject: function(e, d){
            if (!d || !e) {
                throw new Error('augment failed, please check that all dependencies are included.');
            }
            var b = arguments, c, f;
            if (b[2]) {
                if (YAO.isString(b[2])) {
                    e[b[2]] = d[b[2]];
                }
                else {
                    for (c = 0; c < b[2].length; c += 1) {
                        e[b[2][c]] = d[b[2][c]];
                    }
                }
            }
            else {
                for (f in d) {
                    e[f] = d[f];
                }
            }
            return e;
        },
        clone: function(d, f){
            var e = function(){
            }, b, c = arguments;
            e.prototype = d;
            b = new e;
            if (f) {
                for (p in f) {
                    b[p] = f[p];
                }
            }
            return b;
        },
		
		addListener: function(el, sType, fn, obj, overrideContext, bCapture){
			var oEl = null, context = null, wrappedFn = null;
			if(YAO.isString(el)){
				oEl = YAO.getEl(el);
				el = oEl;
			}
			if(!el || !fn || !fn.call){
				return false;
			}
			context = el;
			if (overrideContext) {
				if (overrideContext === true) {
					context = obj;
				}
				else {
					context = overrideContext;
				}
			}
			wrappedFn = function(e){
				return fn.call(context, YAO.getEvent(e, el), obj);
			};
			try {
				try {
					el.addEventListener(sType, wrappedFn, bCapture);
				} 
				catch (e) {
					try {
						el.attachEvent('on' + sType, wrappedFn);
					} 
					catch (e) {
						el['on' + sType] = wrappedFn;
					}
				}
			} 
			catch (e) {
				lastError = e;
				this.removeListener(el, sType, wrappedFn, bCapture);
				return false;
			}
			if ('unload' != sType) {
				// cache the listener so we can try to automatically unload
				listeners[listeners.length] = [el, sType, fn, wrappedFn, bCapture];
			}
			return true;
		},
        removeListener: function(el, sType, fn, bCapture){
			try {
				if (window.removeEventListener) {
					return function(el, sType, fn, bCapture){
						el.removeEventListener(sType, fn, (bCapture));
					};
				}
				else {
					if (window.detachEvent) {
						return function(el, sType, fn){
							el.detachEvent("on" + sType, fn);
						};
					}
					else {
						return function(){
						};
					}
				}
			} 
			catch (e) {
				lastError = e;
				return false;
			}
			
			return true;
		},
		on: function(el, sType, fn, obj, overrideContext){
			var oEl = obj || el, scope = overrideContext || this;
			return YAO.addListener(el, sType, fn, oEl, scope, false);
		},
		stopEvent: function(evt){
			this.stopPropagation(evt);
			this.preventDefault(evt);
		},
		stopPropagation: function(evt){
			if (evt.stopPropagation) {
				evt.stopPropagation();
			}
			else {
				evt.cancelBubble = true;
			}
		},
		preventDefault: function(evt){
			if (evt.preventDefault) {
				evt.preventDefault();
			}
			else {
				evt.returnValue = false;
			}
		},
		getEvent: function(e, boundEl){
			var ev = e || window.event;
			
			if (!ev) {
				var c = this.getEvent.caller;
				while (c) {
					ev = c.arguments[0];
					if (ev && Event == ev.constructor) {
						break;
					}
					c = c.caller;
				}
			}
			
			return ev;
		},
		getCharCode: function(ev){
			var code = ev.keyCode || ev.charCode || 0;
			
			// webkit key normalization
			if (YAO.ua.webkit && (code in webkitKeymap)) {
				code = webkitKeymap[code];
			}
			return code;
		},
		_unload: function(e){
			var j, l;
			if (listeners) {
				for (j = listeners.length - 1; j > -1; j--) {
					l = listeners[j];
					if (l) {
						YAO.removeListener(l[0], l[1], l[3], l[4]);
					}
				}
				l = null;
			}
			
			YAO.removeListener(window, "unload", YAO._unload);
		},
		
		getEl: function(elem){
			var elemID, E, m, i, k, length, len;
			if (elem) {
				if (elem[nt] || elem.item) {
					return elem;
				}
				if (YAO.isString(elem)) {
					elemID = elem;
					elem = D.getElementById(elem);
					if (elem && elem.id === elemID) {
						return elem;
					}
					else {
						if (elem && elem.all) {
							elem = null;
							E = D.all[elemID];
							for (i = 0, len = E.length; i < len; i += 1) {
								if (E[i].id === elemID) {
									return E[i];
								}
							}
						}
					}
					return elem;
				}
				else {
					if (elem.DOM_EVENTS) {
						elem = elem.get("element");
					}
					else {
						if (YAO.isArray(elem)) {
							m = [];
							for (k = 0, length = elem.length; k < length; k += 1) {
								m[m.length] = YAO.getEl(elem[k]);
							}
							return m;
						}
					}
				}
			}
			return null;
		},
		hasClass: function(elem, className){
			var has = new RegExp("(?:^|\\s+)" + className + "(?:\\s+|$)");
			return has.test(elem.className);
		},
		addClass: function(elem, className){
			if (YAO.hasClass(elem, className)) {
				return;
			}
			elem.className = [elem.className, className].join(" ");
		},
		removeClass: function(elem, className){
			var replace = new RegExp("(?:^|\\s+)" + className + "(?:\\s+|$)", "g");
			if (!YAO.hasClass(elem, className)) {
				return;
			}
			var o = elem.className;
			elem.className = o.replace(replace, " ");
			if (YAO.hasClass(elem, className)) {
				YAO.removeClass(elem, className);
			}
		},
		replaceClass: function(elem, newClass, oldClass){
			if (newClass === oldClass) {
				return false;
			}
			var has = new RegExp("(?:^|\\s+)" + newClass + "(?:\\s+|$)", "g");
			if (!YAO.hasClass(elem, newClass)) {
				YAO.addClass(elem, oldClass);
				return;
			}
			elem.className = elem.className.replace(has, " " + oldClass + " ");
			if (YAO.hasClass(elem, newClass)) {
				YAO.replaceClass(elem, newClass, oldClass);
			}
		},
		getElByClassName: function(className, tag, rootTag){
			var elems = [], i, tempCnt = YAO.getEl(rootTag).getElementsByTagName(tag), len = tempCnt.length;
			for (i = 0; i < len; ++i) {
				if (YAO.hasClass(tempCnt[i], className)) {
					elems.push(tempCnt[i]);
				}
			}
			if (elems.length < 1) {
				return false;
			}
			else {
				return elems;
			}
		},
		getStyle: function(el, property){
			if (document.defaultView && document.defaultView.getComputedStyle) {
				var value = null;
				if (property == 'float') {
					property = 'cssFloat';
				}
				var computed = document.defaultView.getComputedStyle(el, '');
				if (computed) {
					value = computed[YAO.toCamel(property)];
				}
				return el.style[property] || value;
			}
			else {
				if (document.documentElement.currentStyle && YAO.ua.ie) {
					switch (YAO.toCamel(property)) {
						case 'opacity':
							var val = 100;
							try {
								val = el.filters['DXImageTransform.Microsoft.Alpha'].opacity;
							} 
							catch (e) {
								try {
									val = el.filters('alpha').opacity;
								} 
								catch (e) {
								}
							}
							return val / 100;
							break;
						case 'float':
							property = 'styleFloat';
						default:
							var value = el.currentStyle ? el.currentStyle[property] : null;
							return (el.style[property] || value);
					}
				}
				else {
					return el.style[property];
				}
			}
		},
		setStyle: function(el, property, val){
			if (YAO.ua.ie) {
				switch (property) {
					case 'opacity':
						if (YAO.isString(el.style.filter)) {
							el.style.filter = 'alpha(opacity=' + val * 100 + ')';
							if (!el.currentStyle || !el.currentStyle.hasLayout) {
								el.style.zoom = 1;
							}
						}
						break;
					case 'float':
						property = 'styleFloat';
					default:
						el.style[property] = val;
				}
			}
			else {
				if (property == 'float') {
					property = 'cssFloat';
				}
				el.style[property] = val;
			}
		},
		setStyles: function(el, propertys){
			for(var p in propertys){
				YAO.setStyle(el,p,propertys[p]);
			}
			return el;
		},
        getElementsBy: function(method, tag, root){
            tag = tag || "*";
            var m = [];
            if (root) {
                root = YAO.getEl(root);
                if (!root) {
                    return m;
                }
            }
            else {
                root = document;
            }
            var oElem = root.getElementsByTagName(tag);
            if (!oElem.length && (tag === "*" && root.all)) {
                oElem = root.all;
            }
            for (var n = 0, j = oElem.length; n < j; ++n) {
                if (method(oElem[n])) {
                    m[m.length] = oElem[n];
                }
            }
            return m;
        },
        getDocumentWidth: function(){
            var k = YAO.getScrollWidth();
            var j = Math.max(k, YAO.getViewportWidth());
            return j;
        },
        getDocumentHeight: function(){
            var k = YAO.getScrollHeight();
            var j = Math.max(k, YAO.getViewportHeight());
            return j;
        },
        getScrollWidth: function(){
            var j = (D.compatMode == "CSS1Compat") ? D.body.scrollWidth : D.Element.scrollWidth;
            return j;
        },
        getScrollHeight: function(){
            var j = (D.compatMode == "CSS1Compat") ? D.body.scrollHeight : D.documentElement.scrollHeight;
            return j;
        },
        getXScroll: function(){
            var j = self.pageXOffset || D.documentElement.scrollLeft || D.body.scrollLeft;
            return j;
        },
        getYScroll: function(){
            var j = self.pageYOffset || D.documentElement.scrollTop || D.body.scrollTop;
            return j;
        },
        getViewportWidth: function(){
            var j = self.innerWidth;
            var k = D.compatMode;
            if (k || c) {
                j = (k == "CSS1Compat") ? D.documentElement.clientWidth : D.body.clientWidth;
            }
            return j;
        },
        getViewportHeight: function(){
            var j = self.innerHeight,k = D.compatMode,a = YAO.ua.opera;
            if ((k || c) && !a) {
                j = (k == "CSS1Compat") ? D.documentElement.clientHeight : D.body.clientHeight;
            }
            return j;
        },
        removeChildren: function(j){
            if (!(prent = YAO.getEl(j))) {
                return false;
            }
            while (j.firstChild) {
                j.firstChild.parentNode.removeChild(j.firstChild);
            }
            return j;
        },
        prependChild: function(k, j){
            if (!(k = YAO.getEl(k)) || !(j = YAO.getEl(j))) {
                return false;
            }
            if (k.firstChild) {
                k.insertBefore(j, k.firstChild);
            }
            else {
                k.appendChild(j);
            }
            return k;
        },
        insertAfter: function(l, j){
            var k = j.parentNode;
            if (k.lastChild == j) {
                k.appendChild(l);
            }
            else {
                k.insertBefore(l, j.nextSibling);
            }
        },
		setOpacity: function(el, val){
			YAO.setStyle(el, 'opacity', val);
		},
		Builder: {
			nidx: 0,
			NODEMAP: {
				AREA: 'map',
				CAPTION: 'table',
				COL: 'table',
				COLGROUP: 'table',
				LEGEND: 'fieldset',
				OPTGROUP: 'select',
				OPTION: 'select',
				PARAM: 'object',
				TBODY: 'table',
				TD: 'table',
				TFOOT: 'table',
				TH: 'table',
				THEAD: 'table',
				TR: 'table'
			},
			ATTR_MAP: {
				'className': 'class',
				'htmlFor': 'for',
				'readOnly': 'readonly',
				'maxLength': 'maxlength',
				'cellSpacing': 'cellspacing'
			},
			EMPTY_TAG: /^(?:BR|FRAME|HR|IMG|INPUT|LINK|META|RANGE|SPACER|WBR|AREA|PARAM|COL)$/i,
			// 杩藉姞Link鑺傜偣锛堟坊鍔燙SS鏍峰紡琛級
			linkNode: function(url, cssId, charset){
				var c = charset || 'utf-8', link = null;
				var head = D.getElementsByTagName('head')[0];
				link = this.Node('link', {
					'id': cssId || ('link-' + (YAO.Builder.nidx++)),
					'type': 'text/css',
					'charset': c,
					'rel': 'stylesheet',
					'href': url
				});
				head.appendChild(link);
				return link;
			},
			// 杩藉姞Script鑺傜偣
			scriptNode: function(url, scriptId, win, charset){
				var d = win || document.body;
				var c = charset || 'utf-8';
				return d.appendChild(this.Node('script', {
					'id': scriptId || ('script-' + (YAO.Builder.nidx++)),
					'type': 'text/javascript',
					'charset': c,
					'src': url
				}));
			},
			// 鍒涘缓鍏冪礌鑺傜偣
			Node: function(tag, attr, children){
				tag = tag.toUpperCase();
				// try innerHTML approach
				var parentTag = YAO.Builder.NODEMAP[tag] || 'div';
				var parentElement = D.createElement(parentTag);
				var elem = null;
				try { // prevent IE "feature": http://dev.rubyonrails.org/ticket/2707
				    if (this.EMPTY_TAG.test(tag)) {
						//alert(tag);
					}
					else {
						parentElement.innerHTML = "<" + tag + "></" + tag + ">";
					}
				} 
				catch (e) {
				}
				elem = parentElement.firstChild;
				
				// see if browser added wrapping tags
				if (elem && (elem.tagName.toUpperCase() != tag)) {
					elem = elem.getElementsByTagName(tag)[0];
				}
				// fallback to createElement approach
				if (!elem) {
					if (YAO.isString(tag)) {
						elem = D.createElement(tag);
					}
				}
				// abort if nothing could be created
				if (!elem) {
					return;
				}
				else {
					if (attr) {
						this.Attributes(elem, attr);
					}
					if (children) {
						this.Child(elem, children);
					}
					return elem;
				}
			},
			// 缁欒妭鐐规坊鍔犲睘鎬�
			Attributes: function(elem, attr){
				var attrName = '', i;
				for (i in attr) {
					if (attr[i] && YAO.hasOwnProperty(attr, i)) {
						attrName = i in YAO.Builder.ATTR_MAP ? YAO.Builder.ATTR_MAP[i] : i;
						if (attrName === 'class') {
							elem.className = attr[i];
						}
						else {
							elem.setAttribute(attrName, attr[i]);
						}
					}
				}
				return elem;
			},
			// 杩藉姞瀛愯妭鐐�
			Child: function(parent, child){
				if (child.tagName) {
					parent.appendChild(child);
					return false;
				}
				if (YAO.isArray(child)) {
					var i, length = child.length;
					for (i = 0; i < length; i += 1) {
						if (child[i].tagName) {
							parent.appendChild(child[i]);
						}
						else {
							if (YAO.isString(child[i])) {
								parent.appendChild(D.createTextNode(child[i]));
							}
						}
					}
				}
				else {
					if (YAO.isString(child)) {
						parent.appendChild(D.createTextNode(child));
					}
				}
			}
		},
		
		batch: function(el, method, o, override){
			var id = el;
			el = YAO.getEl(el);
			var scope = (override) ? o : window;
			if (!el || el.tagName || !el.length) {
				if (!el) {
					return false;
				}
				return method.call(scope, el, o);
			}
			var collection = [];
			for (var i = 0, len = el.length; i < len; ++i) {
				if (!el[i]) {
					id = el[i];
				}
				collection[collection.length] = method.call(scope, el[i], o);
			}
			return collection;
		},

		fadeUp: function(elem){
			if (elem) {
				var level = 0, fade = function(){
					var timer = null;
					level += 0.05;
					if (timer) {
						clearTimeout(timer);
						timer = null;
					}
					if (level > 1) {
						YAO.setOpacity(elem, 1);
						return false;
					}
					else {
						YAO.setOpacity(elem, level);
					}
					timer = setTimeout(fade, 50);
				};
				fade();
			}
		},
		zebra: function(){
			var j, length = arguments.length;
			for (j = 0; j < length; ++j) {
				(function(config){
					var root = YAO.getEl(config.rootTag) || (config.root || null), rows = root.getElementsByTagName(config.rowTag) || (config.rows || null), i, len = rows.length, lastClass = [];
					if (root && rows && len > 1) {
						for (var i = 0; i < len; ++i) {
							rows[i].className = i % 2 === 0 ? 'even' : 'odd';
							lastClass[i] = rows[i].className;
							YAO.on(rows[i],'mouseover', function(index){
								return function(){
									YAO.replaceClass(this, lastClass[index], 'hover');
								}
							}(i),rows[i],true);
							YAO.on(rows[i], 'mouseout', function(index){
								return function(){
									YAO.replaceClass(this, 'hover', lastClass[index]);
								}
							}(i),rows[i],true);
						}
					}
					else {
						return false;
					}
				})(arguments[j]);
			}
		},
		moveElement: function(element, finalX, finalY, speed){
			var elem = YAO.isString(element) ? YAO.getEl(element) : element, style = null;
			if (elem) {
				if (elem.movement) {
					clearTimeout(elem.movement);
				}
				if (!elem.style.left) {
					elem.style.left = "0";
				}
				if (!elem.style.top) {
					elem.style.top = "0";
				}
				var xpos = parseInt(elem.style.left);
				var ypos = parseInt(elem.style.top);
				if (xpos == finalX && ypos == finalY) {
					return true;
				}
				if (xpos < finalX) {
					var dist = Math.ceil((finalX - xpos) / 10);
					xpos = xpos + dist;
				}
				if (xpos > finalX) {
					var dist = Math.ceil((xpos - finalX) / 10);
					xpos = xpos - dist;
				}
				if (ypos < finalY) {
					var dist = Math.ceil((finalY - ypos) / 10);
					ypos = ypos + dist;
				}
				if (ypos > finalY) {
					var dist = Math.ceil((ypos - finalY) / 10);
					ypos = ypos - dist;
				}
				elem.style.left = xpos + "px";
				elem.style.top = ypos + "px";
				elem.movement = setTimeout(function(){
					YAO.moveElement(element, finalX, finalY, speed);
				}, speed);
			}
		},
		
		ajax: function(config){
			var oXhr, method = config.method ? config.method.toUpperCase() : 'GET', url = config.url || '', fn = config.fn || null, postData = config.data || null, elem = config.id ? YAO.getEl(config.id) : (config.element || null), load = config.loadFn ? config.loadFn : (config.loading || '姝ｅ湪鑾峰彇鏁版嵁锛岃绋嶅悗...');
			if (!url) {
				return;
			}
			if (window.XMLHttpRequest) {
				oXhr = new XMLHttpRequest();
			}
			else {
				if (window.ActiveXObject) {
					oXhr = new ActiveXObject("Microsoft.XMLHTTP");
				}
			}
			if (oXhr) {
				try {
					oXhr.open(method, url, true);
					oXhr.onreadystatechange = function(){
						if (oXhr.readyState !== 4) {
							return false
						}
						if (oXhr.readyState == 4) {
							if (oXhr.status == 200 || location.href.indexOf('http') === -1) {
								if (fn) {
									fn.success(oXhr);
								}
								else {
									elem.innerHTML = oXhr.responseText;
								}
							}
							else {
								if (fn) {
									fn.failure(oXhr.status);
								}
								else {
									if (YAO.isFunction(load)) {
										load();
									}
									else {
										elem.innerHTML = load;
									}
								}
							}
						}
					};
					oXhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
					if (postData) {
						oXhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
					}
					oXhr.send(postData);
				} 
				catch (e) {
					throw new Error(e);
					return false;
				}
			}
			else{
				throw new Error("Your browser does not support XMLHTTP.");
				return false;
			}
		},
		JSON: function(){
			function f(n){
				return n < 10 ? '0' + n : n;
			}
			
			Date.prototype.toJSON = function(){
				return this.getUTCFullYear() + '-' + f(this.getUTCMonth() + 1) + '-' + f(this.getUTCDate()) + 'T' + f(this.getUTCHours()) + ':' + f(this.getUTCMinutes()) + ':' + f(this.getUTCSeconds()) + 'Z';
			};
			
			var m = {
				'\b': '\\b',
				'\t': '\\t',
				'\n': '\\n',
				'\f': '\\f',
				'\r': '\\r',
				'"': '\\"',
				'\\': '\\\\'
			};
			
			function stringify(value, whitelist){
				var a, i, k, l, r = /["\\\x00-\x1f\x7f-\x9f]/g, v;
				switch (typeof value) {
					case 'string':
						return r.test(value) ? '"' +
						value.replace(r, function(a){
							var c = m[a];
							if (c) {
								return c;
							}
							c = a.charCodeAt();
							return '\\u00' + Math.floor(c / 16).toString(16) + (c % 16).toString(16);
						}) +
						'"' : '"' + value + '"';
					case 'number':
						return isFinite(value) ? String(value) : 'null';
					case 'boolean':
					case 'null':
						return String(value);
					case 'object':
						if (!value) {
							return 'null';
						}
						
						if (typeof value.toJSON === 'function') {
							return stringify(value.toJSON());
						}
						a = [];
						if (typeof value.length === 'number' && !(value.propertyIsEnumerable('length'))) {
						
							l = value.length;
							for (i = 0; i < l; i += 1) {
								a.push(stringify(value[i], whitelist) || 'null');
							}
							
							return '[' + a.join(',') + ']';
						}
						if (whitelist) {
							l = whitelist.length;
							for (i = 0; i < l; i += 1) {
								k = whitelist[i];
								if (typeof k === 'string') {
									v = stringify(value[k], whitelist);
									if (v) {
										a.push(stringify(k) + ':' + v);
									}
								}
							}
						}
						else {
							for (k in value) {
								if (typeof k === 'string') {
									v = stringify(value[k], whitelist);
									if (v) {
										a.push(stringify(k) + ':' + v);
									}
								}
							}
						}
						return '{' + a.join(',') + '}';
				}
			}
			
			return {
				stringify: stringify,
				parse: function(text, filter){
					var j;
					
					function walk(k, v){
						var i, n;
						if (v && typeof v === 'object') {
							for (i in v) {
								if (OP.hasOwnProperty.apply(v, [i])) {
									n = walk(i, v[i]);
									if (n !== undefined) {
										v[i] = n;
									}
									else {
										delete v[i];
									}
								}
							}
						}
						return filter(k, v);
					}
					
					if (/^[\],:{}\s]*$/.test(text.replace(/\\./g, '@').replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']').replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {
						j = eval('(' + text + ')');
						
						return typeof filter === 'function' ? walk('', j) : j;
					}
					
					throw new SyntaxError('parseJSON');
				}
			};
		}(),
		
		YTabs: function(){
			var j, len = arguments.length, Tabs = [];
			for (j = 0; j < len; ++j) {
				Tabs[j] = new YAO.singleTab(arguments[j]);
			}
			return Tabs;
		},
		scrollNews: function(S, SI, RT, CT){
            var SN = new YAO.scrollVertical(S, SI, RT, CT);
            SN.speed = 4000;
            SN.isPause = true;
            var TM = setTimeout(function(){
                if (TM) {
                    clearTimeout(TM);
                }
                SN.isPause = false;
            }, 2000);
            YAO.on(SN.scrollArea, 'mouseover', function(){
                SN.isPause = true;
            });
            YAO.on(SN.scrollArea, 'mouseout', function(){
                SN.isPause = false;
            });
        }
	};
	
	YAO.on(window, "unload", YAO._unload);
}();

/**************************************************
 * dom-drag.js
 * 09.25.2001
 * www.youngpup.net
 * Script featured on Dynamic Drive (http://www.dynamicdrive.com) 12.08.2005
 **************************************************
 * 10.28.2001 - fixed minor bug where events
 * sometimes fired off the handle, not the root.
 **************************************************/
YAO.Drag = {
	obj: null,
	init: function(o, oRoot, minX, maxX, minY, maxY, bSwapHorzRef, bSwapVertRef, fXMapper, fYMapper){
		if (!o || !oRoot) {
			return false;
		}
		o.style.cursor = 'move';
		o.onmousedown = YAO.Drag.start;
		o.hmode = bSwapHorzRef ? false : true;
		o.vmode = bSwapVertRef ? false : true;
		o.root = oRoot && oRoot != null ? oRoot : o;
		if (o.hmode && isNaN(parseInt(o.root.style.left, 10))) {
			o.root.style.left = '0';
		}
		if (o.vmode && isNaN(parseInt(o.root.style.top, 10))) {
			o.root.style.top = '0';
		}
		if (!o.hmode && isNaN(parseInt(o.root.style.right, 10))) {
			o.root.style.right = '0';
		}
		if (!o.vmode && isNaN(parseInt(o.root.style.bottom, 10))) {
			o.root.style.bottom = '0';
		}
		o.minX = typeof minX != 'undefined' ? minX : null;
		o.minY = typeof minY != 'undefined' ? minY : null;
		o.maxX = typeof maxX != 'undefined' ? maxX : null;
		o.maxY = typeof maxY != 'undefined' ? maxY : null;
		o.xMapper = fXMapper ? fXMapper : null;
		o.yMapper = fYMapper ? fYMapper : null;
		o.root.onDragStart = new Function();
		o.root.onDragEnd = new Function();
		o.root.onDrag = new Function();
	},
	start: function(e){
		var o = this;
		YAO.Drag.obj = this;
		e = YAO.Drag.fixE(e);
		YAO.Drag.opacity(o.root, 50);
		var y = parseInt(o.vmode ? o.root.style.top : o.root.style.bottom);
		var x = parseInt(o.hmode ? o.root.style.left : o.root.style.right);
		o.root.onDragStart(x, y);
		o.lastMouseX = e.clientX;
		o.lastMouseY = e.clientY;
		if (o.hmode) {
			if (o.minX != null) {
				o.minMouseX = e.clientX - x + o.minX;
			}
			if (o.maxX != null) {
				o.maxMouseX = o.minMouseX + o.maxX - o.minX;
			}
		}
		else {
			if (o.minX != null) {
				o.maxMouseX = -o.minX + e.clientX + x;
			}
			if (o.maxX != null) {
				o.minMouseX = -o.maxX + e.clientX + x;
			}
		}
		if (o.vmode) {
			if (o.minY != null) {
				o.minMouseY = e.clientY - y + o.minY;
			}
			if (o.maxY != null) {
				o.maxMouseY = o.minMouseY + o.maxY - o.minY;
			}
		}
		else {
			if (o.minY != null) {
				o.maxMouseY = -o.minY + e.clientY + y;
			}
			if (o.maxY != null) {
				o.minMouseY = -o.maxY + e.clientY + y;
			}
		}
		document.onmousemove = YAO.Drag.drag;
		document.onmouseup = YAO.Drag.end;
		return false;
	},
	drag: function(e){
		e = YAO.Drag.fixE(e);
		var o = YAO.Drag.obj;
		var ey = e.clientY;
		var ex = e.clientX;
		var y = parseInt(o.vmode ? o.root.style.top : o.root.style.bottom);
		var x = parseInt(o.hmode ? o.root.style.left : o.root.style.right);
		var nx, ny;
		if (o.minX != null) {
			ex = o.hmode ? Math.max(ex, o.minMouseX) : Math.min(ex, o.maxMouseX);
		}
		if (o.maxX != null) {
			ex = o.hmode ? Math.min(ex, o.maxMouseX) : Math.max(ex, o.minMouseX);
		}
		if (o.minY != null) {
			ey = o.vmode ? Math.max(ey, o.minMouseY) : Math.min(ey, o.maxMouseY);
		}
		if (o.maxY != null) {
			ey = o.vmode ? Math.min(ey, o.maxMouseY) : Math.max(ey, o.minMouseY);
		}
		nx = x + ((ex - o.lastMouseX) * (o.hmode ? 1 : -1));
		ny = y + ((ey - o.lastMouseY) * (o.vmode ? 1 : -1));
		if (o.xMapper) {
			nx = o.xMapper(y);
		}
		else {
			if (o.yMapper) {
				ny = o.yMapper(x);
			}
		}
		o.root.style[o.hmode ? 'left' : 'right'] = nx + 'px';
		o.root.style[o.vmode ? 'top' : 'bottom'] = ny + 'px';
		o.lastMouseX = ex;
		o.lastMouseY = ey;
		o.root.onDrag(nx, ny);
		return false;
	},
	end: function(){
		var o = YAO.Drag.obj;
		document.onmousemove = document.onmouseup = function(){
			return null;
		};
		YAO.Drag.opacity(o.root, 100);
		o.root.onDragEnd(parseInt(o.root.style[o.hmode ? "left" : "right"], 10), parseInt(o.root.style[o.vmode ? "top" : "bottom"], 10));
		o = null;
	},
	fixE: function(e){
		if (typeof e == 'undefined') {
			e = window.event;
		}
		if (typeof e.layerX == 'undefined') {
			e.layerX = e.offsetX;
		}
		if (typeof e.layerY == 'undefined') {
			e.layerY = e.offsetY;
		}
		return e;
	},
	opacity: function(element, value){
		var style = element.style;
		style.opacity = value / 100;
		style.filter = 'alpha(opacity=' + value + ')';
	}
};

YAO.Message = function(){
	var D = document, isDisplay = false, isLocked = false, MSGWidth = 404, msgHeight = 0, msgCss = null, msgTitle = null, msgCloseBar = null, msgTitleBar = null, msgInformation = null, msgContent = null, msgBtnEnter = null, msgBtnCancel = null, msgButtons = null, msgBox = null, msgShardow = null;
	
	return {
		addCSS: function(){
			if (!YAO.getEl('ymessagebox')) {
				msgCss = YAO.Builder.linkNode('css/ymessagebox.css');
			}
		},
		createWindow: function(){
			msgShardow = YAO.Builder.Node('div', {
				id: 'shardow'
			});
			D.body.appendChild(msgShardow);
			msgTitle = YAO.Builder.Node('h2', {
				id: 'msg-title'
			}, '鎻愮ず淇℃伅');
			msgCloseBar = YAO.Builder.Node('div', {
				id: 'msg-closebar'
			}, YAO.Builder.Node('a', {
				href: '#close',
				title: '鍏抽棴绐楀彛'
			}, '鍏抽棴绐楀彛'));
			msgTitleBar = YAO.Builder.Node('div', {
				id: 'msg-titlebar'
			}, [msgTitle, msgCloseBar]);
			msgInformation = YAO.Builder.Node('div', {
				id: 'msg-infoBody'
			});
			msgButtons = YAO.Builder.Node('div', {
				id: 'msg-btns'
			});
			msgContent = YAO.Builder.Node('div', {
				id: 'msg-content'
			}, [msgInformation, msgButtons]);
			msgBox = YAO.Builder.Node('div', {
				id: 'msg-window'
			}, [msgTitleBar, msgContent]);
			D.body.appendChild(msgBox);
			isDisplay = true;
			isLocked = true;
			YAO.on(msgCloseBar, 'click', function(event){
				var evt = event || window.event;
				this.close();
				YAO.stopEvent(evt);
			},msgCloseBar,this);
			
			YAO.on(window, 'scroll', YAO.Message.fixPos);
			YAO.on(window, 'resize', YAO.Message.fixPos);
		},
		msg: function(msg, type, title){
			if (!isLocked) {
				var that = this;
				if (!isDisplay) {
					this.createWindow();
				}
				switch (type) {
					case 'msg':
					case 'info':
					case 'accept':
						YAO.setStyles(msgInformation, {
							background: 'url(img/window/icon-info.gif) 20px 18px no-repeat'
						});
						title = title || '鎻愮ず淇℃伅';
						break;
					case 'alert':
					case 'warn':
						YAO.setStyles(msgInformation, {
							background: 'url(img/window/icon-warning.gif) 20px 18px no-repeat'
						});
						title = title || '璀﹀憡淇℃伅';
						break;
					case 'error':
					case 'err':
						YAO.setStyles(msgInformation, {
							background: 'url(img/window/icon-error.gif) 20px 18px no-repeat'
						});
						title = title || '閿欒淇℃伅';
						break;
					default:
						YAO.setStyles(msgInformation, {
							background: 'url(img/window/icon-info.gif) 20px 18px no-repeat'
						});
						title = title || '鎻愮ず淇℃伅';
						break;
				}
				msgButtons.appendChild(YAO.Builder.Node('a', {
					id: 'msg-btnEnter',
					href: '#ok',
					title: '纭畾'
				}, '纭畾'));
				msgBtnEnter = YAO.getEl('msg-btnEnter');
				msgTitle.innerHTML = title;
				msgInformation.innerHTML = msg;
				YAO.setStyles(msgBtnEnter, {
					'float': 'none',
					'margin': '0 auto'
				});
				this.fixPos();
				YAO.on(msgBtnEnter, 'click', function(event){
					var evt = event || window.event;
					that.close();
					YAO.stopEvent(evt);
				});
			}
		},
		confirm: function(confirmInfo){
			if (!isLocked) {
				var that = this;
				if (!isDisplay) {
					this.createWindow();
				}
				msgButtons.appendChild(YAO.Builder.Node('a', {
					id: 'msg-btnEnter',
					href: '#ok',
					title: '纭畾'
				}, '纭畾'));
				msgButtons.appendChild(YAO.Builder.Node('a', {
					id: 'msg-btnCancel',
					href: '#cancel',
					title: '鍙栨秷'
				}, '鍙栨秷'));
				msgBtnEnter = YAO.getEl('msg-btnEnter');
				msgBtnCancel = YAO.getEl('msg-btnCancel');
				msgTitle.innerHTML = confirmInfo['title'];
				YAO.setStyle(msgInformation, 'background', 'url(img/window/icon-question.gif) 20px 18px no-repeat');
				msgInformation.innerHTML = confirmInfo['msg'];
				YAO.setStyles(msgBtnEnter, {
					'float': 'left',
					'margin': '0'
				});
				this.fixPos();
				YAO.on(msgBtnEnter, 'click', function(event){
					var evt = event || window.event;
					that.close();
					if (confirmInfo['func']) {
						confirmInfo['func']();
					}
					YAO.stopEvent(evt);
				});
				YAO.on(msgBtnCancel, 'click', function(event){
					var evt = event || window.event;
					that.close();
					YAO.stopEvent(evt);
				});
			}
		},
		fixPos: function(){
			if (isDisplay) {
				var that = this;
				var documentWidth = YAO.getDocumentWidth();
				var documentHeight = YAO.getDocumentHeight();
				var viewportWidth = YAO.getViewportWidth();
				var viewportHeight = YAO.getViewportHeight();
				var xScroll = YAO.getXScroll();
				var yScroll = YAO.getYScroll();
				var msgboxWidth = msgBox.offsetWidth;
				var msgboxHeight = msgBox.offsetHeight;
				var left = xScroll + ((viewportWidth - msgboxWidth) / 2);
				var top = yScroll + ((viewportHeight - msgboxHeight) / 2);
				
				if (msgboxWidth > viewportWidth) {
					left = xScroll + (viewportWidth - msgboxWidth);
				}
				if (msgboxHeight > viewportHeight) {
					if (yScroll < (documentHeight - msgboxHeight)) {
						top = yScroll;
					}
					else {
						top = (documentHeight - msgboxHeight);
					}
				}
				YAO.setStyles(msgShardow, {
					width: documentWidth + 'px',
					height: documentHeight + 'px'
				});
				YAO.setStyles(msgBox, {
					margin: '0',
					top: top + 'px',
					left: left + 'px'
				});
				that.drag(documentWidth, documentHeight, msgboxWidth, msgboxHeight);
			}
		},
		drag: function(docWidth, docHeight, msgboxWidth, msgboxHeight){
			var maxWidth = docWidth - msgboxWidth;
			var maxHeight = docHeight - msgboxHeight;
			YAO.Drag.init(msgTitleBar, msgBox, 0, maxWidth, 0, maxHeight);
		},
		close: function(){
			if (isDisplay) {
				if (msgShardow) {
					D.body.removeChild(msgShardow);
				}
				if (msgButtons.hasChildNodes()) {
					YAO.removeChildren(msgButtons);
					msgButtons = null;
				}
				D.body.removeChild(msgBox);
				isDisplay = false;
				isLocked = false;
			}
		}
	};
}();