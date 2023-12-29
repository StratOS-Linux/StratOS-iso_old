import GLib from 'gi://GLib';
export class Timeout {
    constructor() {
        this._timeoutId = null;
    }
    destroy() {
        this._clearTimeout();
    }
    tick() {
        return new Promise((resolve) => {
            this._clearTimeout();
            this._timeoutId = GLib.timeout_add_seconds(GLib.PRIORITY_DEFAULT, 0, () => {
                this._timeoutId = null;
                resolve();
                return GLib.SOURCE_REMOVE;
            });
        });
    }
    _clearTimeout() {
        if (this._timeoutId) {
            GLib.Source.remove(this._timeoutId);
            this._timeoutId = null;
        }
    }
}
