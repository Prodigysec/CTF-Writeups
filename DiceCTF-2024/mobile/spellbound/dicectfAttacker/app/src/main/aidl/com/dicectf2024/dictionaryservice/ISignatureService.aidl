package com.dicectf2024.dictionaryservice;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* loaded from: classes.dex */
public interface ISignatureService extends IInterface {
    public static final String DESCRIPTOR = "com.dicectf2024.dictionaryservice.ISignatureService";

    /* loaded from: classes.dex */
    public static class Default implements ISignatureService {
        @Override // android.os.IInterface
        public IBinder asBinder() {
            return null;
        }

        @Override // com.dicectf2024.dictionaryservice.ISignatureService
        public String sign(String str) throws RemoteException {
            return null;
        }
    }

    String sign(String str) throws RemoteException;

    /* loaded from: classes.dex */
    public static abstract class Stub extends Binder implements ISignatureService {
        static final int TRANSACTION_sign = 1;

        @Override // android.os.IInterface
        public IBinder asBinder() {
            return this;
        }

        public Stub() {
            attachInterface(this, ISignatureService.DESCRIPTOR);
        }

        public static ISignatureService asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(ISignatureService.DESCRIPTOR);
            if (queryLocalInterface != null && (queryLocalInterface instanceof ISignatureService)) {
                return (ISignatureService) queryLocalInterface;
            }
            return new Proxy(iBinder);
        }

        @Override // android.os.Binder
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            if (i >= 1 && i <= 16777215) {
                parcel.enforceInterface(ISignatureService.DESCRIPTOR);
            }
            if (i == 1598968902) {
                parcel2.writeString(ISignatureService.DESCRIPTOR);
                return true;
            } else if (i == 1) {
                String sign = sign(parcel.readString());
                parcel2.writeNoException();
                parcel2.writeString(sign);
                return true;
            } else {
                return super.onTransact(i, parcel, parcel2, i2);
            }
        }

        /* loaded from: classes.dex */
        private static class Proxy implements ISignatureService {
            private IBinder mRemote;

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return ISignatureService.DESCRIPTOR;
            }

            Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            @Override // com.dicectf2024.dictionaryservice.ISignatureService
            public String sign(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(ISignatureService.DESCRIPTOR);
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