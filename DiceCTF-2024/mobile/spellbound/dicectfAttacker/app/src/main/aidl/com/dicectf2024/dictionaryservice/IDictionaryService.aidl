package com.dicectf2024.dictionaryservice;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* loaded from: classes.dex */
public interface IDictionaryService extends IInterface {
    public static final String DESCRIPTOR = "com.dicectf2024.dictionaryservice.IDictionaryService";

    /* loaded from: classes.dex */
    public static class Default implements IDictionaryService {
        @Override // android.os.IInterface
        public IBinder asBinder() {
            return null;
        }

        @Override // com.dicectf2024.dictionaryservice.IDictionaryService
        public String getData(String str) throws RemoteException {
            return null;
        }
    }

    String getData(String str) throws RemoteException;

    /* loaded from: classes.dex */
    public static abstract class Stub extends Binder implements IDictionaryService {
        static final int TRANSACTION_getData = 1;

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        public Stub() {
            attachInterface(this, IDictionaryService.DESCRIPTOR);
        }

        public static IDictionaryService asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(IDictionaryService.DESCRIPTOR);
            if (queryLocalInterface != null && (queryLocalInterface instanceof IDictionaryService)) {
                return (IDictionaryService) queryLocalInterface;
            }
            return new Proxy(iBinder);
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i >= 1 && i <= 16777215) {
                parcel.enforceInterface(IDictionaryService.DESCRIPTOR);
            }
            if (i == 1598968902) {
                parcel2.writeString(IDictionaryService.DESCRIPTOR);
                return true;
            } else if (i == 1) {
                String data = getData(parcel.readString());
                parcel2.writeNoException();
                parcel2.writeString(data);
                return true;
            } else {
                return super.onTransact(i, parcel, parcel2, i2);
            }
        }

        /* loaded from: classes.dex */
        private static class Proxy implements IDictionaryService {
            private IBinder mRemote;

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return IDictionaryService.DESCRIPTOR;
            }

            Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            @Override // com.dicectf2024.dictionaryservice.IDictionaryService
            public String getData(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(IDictionaryService.DESCRIPTOR);
                    obtain.writeString(str);
                    this.mRemote.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readString();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }
    }
}