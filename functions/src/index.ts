import { onRequest } from 'firebase-functions/v2/https';
import * as logger from 'firebase-functions/logger';

import { auth } from 'firebase-functions';

import { initializeApp } from 'firebase-admin/app';
import { getFirestore } from 'firebase-admin/firestore';

initializeApp({ projectId: 'ipenda' });
const db = getFirestore();

export const helloWorld = onRequest((request, response) => {
    logger.info('Hello logs!', { structuredData: true });
    response.send('Hello from Firebase!');
});

exports.sendWelcomeEmail = auth.user().onCreate(async (user) => {
    const { uid, emailVerified, email, displayName, photoURL, phoneNumber, disabled, providerData, customClaims, metadata } = user;
    const { creationTime, lastSignInTime } = metadata;

    const userData = { emailVerified, email, displayName, photoURL, phoneNumber, disabled, providerData, customClaims, creationTime, lastSignInTime };

    const userDocRef = `/users/${uid}`;
    return await db.doc(userDocRef).set({ ...userData });
});
