Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF5989E8A3
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 10 Apr 2024 06:00:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ruP8b-0005UK-GX
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 10 Apr 2024 04:00:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <andy.shevchenko@gmail.com>) id 1ruP8Z-0005Ty-Pv
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 04:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NtI0xN3dWIHgnuVFP5emBfSv80l93K/NAVupuO8w05w=; b=bUBwZIVIKWj9VlzyL23AnYTpco
 RJMrid9BHANX96wmsCRzUx0nmUUuwUqBkIWkTZjNbOvnV0DWo4sjg6yGhCmWVSUCl1VwGjhjzm4H3
 23FAqd0pHp87kdeqnIe41fcLRIv1uW/ZJNNAfeEnd7wcdYwPlW7SOiqxAo8bi3z+yReo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NtI0xN3dWIHgnuVFP5emBfSv80l93K/NAVupuO8w05w=; b=RPUqQTIx3CdjP8R0ybdxmKSR3K
 zPuR5JCACnwHAerQSccD+yCmi92KknhR7ra+zdBwsX7raUmyJy1y/d8r2KGsAo6+Z3cHoc0Q7RgXX
 +UfPTRaRxRvqc7w6cFtis4B7T/4t0YWApkn/edEqZv082+l4fa6I/omUVbeSUfxvGfyo=;
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ruP8E-0008T0-Ol for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 04:00:40 +0000
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-343d6b55c42so4410406f8f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 09 Apr 2024 21:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712721607; x=1713326407; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NtI0xN3dWIHgnuVFP5emBfSv80l93K/NAVupuO8w05w=;
 b=M6CXgyhBRojDLgYEO0u/ELkxT4Mg12PFUYHq1Jwtr95+Iz16oRPjPdEgV7+icTknT/
 uCV2pLsnldbF0uoK9uJUyTjtA35hqiouIdwBiIedR7ifoD8DQmEswaNZiUqCslpTdKPm
 lJLB9H99Voaz/HuvJBmzR9MHN7z3z1TCdhXO9r07cXvzZIfztkZzalKN2lWkGbKE0rQM
 pVbbRcr8TLRvP8MBegNGQdeHf5Ecgaa8qtglT8thraD2Ox+MHB12XRIoWcqz6H7bCRMp
 XfFhwTDVMjEGtRLuA5T7lP2o4mPqGRRnyFhDtWALZFtqXsD6LuOcSglxUzm3LhOJn8Dr
 PW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712721607; x=1713326407;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NtI0xN3dWIHgnuVFP5emBfSv80l93K/NAVupuO8w05w=;
 b=PRodfISTDxmalO2T9q5bPhP1aT9ea1GnadwoGLMRQyH9//TCfxrq2vid7Q3n4/TgQ4
 w5LrBo7OVopbSanI63kVcodWvxtNDAdSn1nB1jYFP8Hb8ST1/ZtfpeS+O9Vr/mFmbCcO
 ANRTzNYEenGJ7A1qcvxsii++82g+QuWA6qMCYxKLWB+52jY+vjKabls5WHEbjQs2ehKD
 c3RTvu+blhlYZT5X0TsDdvpYaXsEFDZ/lKVK0M4Mf+MUIEAjF3avQKt1eLugAyjJLrFO
 zY0zU0rxt8j5YRLf9Xy1jl/MzT5DUeX/XpQwzV4VptR9ViCm66gtkMxq5Is4itBctB3D
 9fpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvyJB4CLoF/IaQq/AM8yZpRy8SXqix7zAgc3RT4fLcblmjzMVOJvZV9sRw0bl6JcnEreftVwjBZiT6X7AlbS39QOTGQAapbj4MvAutRIZcH/vr3rk=
X-Gm-Message-State: AOJu0Yz9m8uX19T2nF2YfmvYEoapGeY1aSmIpEsRLV8mWehidv4HvthY
 18oxw44OlzV6bysXRdgvL1FOfIFbfQmSGvGNK2jgPcTTAHhRgMBsnDQWdTmTDQSlCGnae570Csb
 Pp6lzczbTrd/KEzZLuS2AYLYH4bY=
X-Google-Smtp-Source: AGHT+IFtNSB7v0/NPoH41VWxU2JkNU3nhYJOFnq1c9q7jleCq4KGdhGAc0vtuTzPduNdY1xd55Y8nZFBCpviYCTBvPU=
X-Received: by 2002:a05:6000:2a3:b0:343:8551:8d90 with SMTP id
 l3-20020a05600002a300b0034385518d90mr1602342wry.34.1712721607135; Tue, 09 Apr
 2024 21:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240409020326.2125332-1-liu.yec@h3c.com>
 <20240410020615.2885000-1-liu.yec@h3c.com>
In-Reply-To: <20240410020615.2885000-1-liu.yec@h3c.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 10 Apr 2024 06:59:30 +0300
Message-ID: <CAHp75VdZF-Qi-9ahhXTLxdQqVb7wBJu7KqjD8xj6byVC5W+-yw@mail.gmail.com>
To: liu.yec@h3c.com
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Apr 10, 2024 at 5:07 AM wrote: > > From: LiuYe >
    > Currently, if CONFIG_KDB_KEYBOARD is enabled, then kgdboc will > attempt
    to use schedule_work() to provoke a keyboard reset when > tran [...] 
 
 Content analysis details:   (0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [andy.shevchenko[at]gmail.com]
  0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
  0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1ruP8E-0008T0-Ol
Subject: Re: [Kgdb-bugreport] [PATCH V10] kdb: Fix the deadlock issue in KDB
 debugging.
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgNTowN+KAr0FNIDxsaXUueWVjQGgzYy5jb20+IHdyb3Rl
Ogo+Cj4gRnJvbTogTGl1WWUgPGxpdS55ZUNAaDNjLmNvbT4KPgo+IEN1cnJlbnRseSwgaWYgQ09O
RklHX0tEQl9LRVlCT0FSRCBpcyBlbmFibGVkLCB0aGVuIGtnZGJvYyB3aWxsCj4gYXR0ZW1wdCB0
byB1c2Ugc2NoZWR1bGVfd29yaygpIHRvIHByb3Zva2UgYSBrZXlib2FyZCByZXNldCB3aGVuCj4g
dHJhbnNpdGlvbmluZyBvdXQgb2YgdGhlIGRlYnVnZ2VyIGFuZCBiYWNrIHRvIG5vcm1hbCBvcGVy
YXRpb24uCj4gVGhpcyBjYW4gY2F1c2UgZGVhZGxvY2sgYmVjYXVzZSBzY2hlZHVsZV93b3JrKCkg
aXMgbm90IE5NSS1zYWZlLgo+Cj4gVGhlIHN0YWNrIHRyYWNlIGJlbG93IHNob3dzIGFuIGV4YW1w
bGUgb2YgdGhlIHByb2JsZW0uIEluIHRoaXMKPiBjYXNlIHRoZSBtYXN0ZXIgY3B1IGlzIG5vdCBy
dW5uaW5nIGZyb20gTk1JIGJ1dCBpdCBoYXMgcGFya2VkCj4gdGhlIHNsYXZlIENQVXMgdXNpbmcg
YW4gTk1JIGFuZCB0aGUgcGFya2VkIENQVXMgaXMgaG9sZGluZwo+IHNwaW5sb2NrcyBuZWVkZWQg
Ynkgc2NoZWR1bGVfd29yaygpLgo+Cj4gRXhhbXBsZToKPiBCVUc6IHNwaW5sb2NrIGxvY2t1cCBz
dXNwZWN0ZWQgb24gQ1BVIzAuIG93bmVyX2NwdTogMQo+IENQVTE6IENhbGwgVHJhY2U6Cj4gX19z
Y2hlZHVsZQo+IHNjaGVkdWxlCj4gc2NoZWR1bGVfaHJ0aW1lb3V0X3JhbmdlX2Nsb2NrCj4gbXV0
ZXhfdW5sb2NrCj4gZXBfc2Nhbl9yZWFkeV9saXN0Cj4gc2NoZWR1bGVfaHJ0aW1lb3V0X3Jhbmdl
Cj4gZXBfcG9sbAo+IHdha2VfdXBfcQo+IFN5U19lcG9sbF93YWl0Cj4gZW50cnlfU1lTQ0FMTF82
NF9mYXN0cGF0aAo+Cj4gQ1BVMDogQ2FsbCBUcmFjZToKPiBkdW1wX3N0YWNrCj4gc3Bpbl9kdW1w
Cj4gZG9fcmF3X3NwaW5fbG9jawo+IF9yYXdfc3Bpbl9sb2NrCj4gdHJ5X3RvX3dha2VfdXAKPiB3
YWtlX3VwX3Byb2Nlc3MKPiBpbnNlcnRfd29yawo+IF9fcXVldWVfd29yawo+IHF1ZXVlX3dvcmtf
b24KPiBrZ2Rib2NfcG9zdF9leHBfaGFuZGxlcgo+IGtnZGJfY3B1X2VudGVyCj4ga2dkYl9oYW5k
bGVfZXhjZXB0aW9uCj4gX19rZ2RiX25vdGlmeQo+IGtnZGJfbm90aWZ5Cj4gbm90aWZpZXJfY2Fs
bF9jaGFpbgo+IG5vdGlmeV9kaWUKPiBkb19pbnQzCj4gaW50Mwo+Cj4gV2UgZml4IHRoZSBwcm9i
bGVtIGJ5IHVzaW5nIGlycV93b3JrIHRvIGNhbGwgc2NoZWR1bGVfd29yaygpCj4gaW5zdGVhZCBv
ZiBjYWxsaW5nIGl0IGRpcmVjdGx5LiBUaGlzIGlzIGJlY2F1c2Ugd2UgY2Fubm90Cj4gcmVzeW5j
aHJvbml6ZSB0aGUga2V5Ym9hcmQgc3RhdGUgZnJvbSB0aGUgaGFyZGlycSBjb250ZXh0Cj4gcHJv
dmlkZWQgYnkgaXJxX3dvcmsuIFRoaXMgbXVzdCBiZSBkb25lIGZyb20gdGhlIHRhc2sgY29udGV4
dAo+IGluIG9yZGVyIHRvIGNhbGwgdGhlIGlucHV0IHN1YnN5c3RlbS4KPgo+IFRoZXJlZm9yZSwg
d2UgaGF2ZSB0byBkZWZlciB0aGUgd29yayB0d2ljZS4gRmlyc3QsIHNhZmVseQo+IHN3aXRjaCBm
cm9tIHRoZSBkZWJ1ZyB0cmFwIGNvbnRleHQgKHNpbWlsYXIgdG8gTk1JKSB0byB0aGUKPiBoYXJk
aXJxLCBhbmQgdGhlbiBzd2l0Y2ggZnJvbSB0aGUgaGFyZGlycSB0byB0aGUgc3lzdGVtIHdvcmsg
cXVldWUuCgouLi4KCj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVu
a29AZ21haWwuY29tPgoKPiBWOSAtPiBWMTAgOiBBZGQgU2lnbmVkLW9mZi1ieSBvZiBHcmVnIEtI
IGFuZCBBbmR5IFNoZXZjaGVua28sIEFja2VkLWJ5IG9mIERhbmllbCBUaG9tcHNvbgoKSHVoPyEK
Ci0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBs
aXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
