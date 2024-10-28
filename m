Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 856A09B3C7E
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Oct 2024 22:10:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t5X0A-00057f-A3
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 28 Oct 2024 21:10:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1t5X08-00057M-20
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 28 Oct 2024 21:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fg5LHsnihfFMeaE/D0viDwbqHN3M3/7wht3hCbvfo84=; b=caH8+v56X76dWNSZ7pnxopvzzH
 jH6USf3LqZioLcpa4iwU0qJTv1gLrUJERTxamLNi6WoBxypqH8rYTkvYLLZBjENGviHE0ywh9MLaK
 09ZXa0hn7GJhCNBzRXdlpBz7/2xlqfkZO0PsAFaacp1tIu1R9WbSVAmAKkzKkRvGA/3s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fg5LHsnihfFMeaE/D0viDwbqHN3M3/7wht3hCbvfo84=; b=OTbJg7/2xeYAiMjZ+YE4yc73fY
 tFivHdvA5I+mctewMew7tCni4ftDhvSbqn/r92HMVTlH4U0YEyc01/rPzWtyi/0UAH3ACqJEzY5BT
 U3lsWetsM40HbOozhUu6mU/lIAAzhj97zQCD33AAsqdOnhcrRUDrgcqnovADL1IbhFWs=;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t5X06-0000iI-0p for kgdb-bugreport@lists.sourceforge.net;
 Mon, 28 Oct 2024 21:10:11 +0000
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-539e4b7409fso4588147e87.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 28 Oct 2024 14:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730149802; x=1730754602;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fg5LHsnihfFMeaE/D0viDwbqHN3M3/7wht3hCbvfo84=;
 b=PHLZUim8EiwYo8+7N80LgBNgkzgkKdVC1YTbgSntRT1bHsH1DHlVNUZ2nqxPBy+cEB
 kUsqTF6dLxG+y1w36cYcBgmrDbED3SY6CZjU/hocjIYgfM4NDjLdpy5pp/jKnE6Cg/GG
 WCt/cQX+uKYpuBOoKqGBAnlhw6F0UfVm2ZgrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730149802; x=1730754602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fg5LHsnihfFMeaE/D0viDwbqHN3M3/7wht3hCbvfo84=;
 b=lZXRFCM13iD5RJB/QmHq0kqCQAe30PTt9a2DRJr7+dA3UB17VPXtupWQnJoZ8PWAeb
 MDHrxRIMf37/zATotx5bMB46Qhns8FgwCDk63VMYm9zGD2zLKyrpyV6MvZFlU7bSG7zu
 4AS2mGGx6S4kXc75dYbfEamoTxHxWEeMcWuuJuhXLX1gIBf8d9kx/un6cn/cSQuP3QFd
 1TRLh50hJBKn6nUgFi01I5FMGZz2hyHvruUQEyuXM+pmsISvBRXhmjDmzctzgDtBfUgj
 PQLQODDGzrh/GU3fz9K46pZJIaJyVq1wka7jZYhG9nB/BV8R35wavthSsAeO1LV4fNWB
 XkFg==
X-Gm-Message-State: AOJu0YwMARIZlodzjBZkTzI3jXVRS0YSIOWF4gyrfpobg5rUymOlxOqe
 f9gdP4Tvvn13DNOxoXlDR5SKKirqIpd/hBfAbNR3uBmrDAYaj5IlsE7ov71mscWwg/SDS3L/DEW
 /Ng==
X-Google-Smtp-Source: AGHT+IHp4QXIT+Vl+eDL9rLUrze58G61/GIQ749/1CEoShQd3gdWVuiNUGWLLaqpUdENaAhVCXFejg==
X-Received: by 2002:a05:6512:3c8e:b0:539:e88f:2396 with SMTP id
 2adb3069b0e04-53b4742a6a0mr282601e87.24.1730149801471; 
 Mon, 28 Oct 2024 14:10:01 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e124610sm1179215e87.84.2024.10.28.14.10.00
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 14:10:00 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2fc96f9c41fso47463521fa.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 28 Oct 2024 14:10:00 -0700 (PDT)
X-Received: by 2002:a2e:be20:0:b0:2fb:50e9:34cc with SMTP id
 38308e7fff4ca-2fcda112689mr2795051fa.17.1730149799851; Mon, 28 Oct 2024
 14:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20241028191700.GA918263@lichtman.org>
 <20241028191916.GA918454@lichtman.org>
In-Reply-To: <20241028191916.GA918454@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Oct 2024 14:09:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X0TYPpLow=GGAcNGz5_joKG7-d=-DorDcxh9ppgNdQaA@mail.gmail.com>
Message-ID: <CAD=FV=X0TYPpLow=GGAcNGz5_joKG7-d=-DorDcxh9ppgNdQaA@mail.gmail.com>
To: Nir Lichtman <nir@lichtman.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Oct 28, 2024 at 12:19 PM Nir Lichtman <nir@lichtman.org>
    wrote: > > From: Yuran Pereira <yuran.pereira@hotmail.com> > > The simple_str*
    family of functions perform no error checking in > sce [...] 
 
 Content analysis details:   (-0.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.44 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5X06-0000iI-0p
Subject: Re: [Kgdb-bugreport] [PATCH v4 1/3] kdb: Replace the use of
 simple_strto with safer kstrto in kdb_main
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
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, mhiramat@kernel.org,
 jason.wessel@windriver.com, yuran.pereira@hotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIE9jdCAyOCwgMjAyNCBhdCAxMjoxOeKAr1BNIE5pciBMaWNodG1hbiA8bmly
QGxpY2h0bWFuLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBZdXJhbiBQZXJlaXJhIDx5dXJhbi5wZXJl
aXJhQGhvdG1haWwuY29tPgo+Cj4gVGhlIHNpbXBsZV9zdHIqIGZhbWlseSBvZiBmdW5jdGlvbnMg
cGVyZm9ybSBubyBlcnJvciBjaGVja2luZyBpbgo+IHNjZW5hcmlvcyB3aGVyZSB0aGUgaW5wdXQg
dmFsdWUgb3ZlcmZsb3dzIHRoZSBpbnRlbmRlZCBvdXRwdXQgdmFyaWFibGUuCj4gVGhpcyByZXN1
bHRzIGluIHRoZXNlIGZ1bmN0aW9ucyBzdWNjZXNzZnVsbHkgcmV0dXJuaW5nIGV2ZW4gd2hlbiB0
aGUKPiBvdXRwdXQgZG9lcyBub3QgbWF0Y2ggdGhlIGlucHV0IHN0cmluZy4KPgo+IE9yIGFzIGl0
IHdhcyBtZW50aW9uZWQgWzFdLCAiLi4uc2ltcGxlX3N0cnRvbCgpLCBzaW1wbGVfc3RydG9sbCgp
LAo+IHNpbXBsZV9zdHJ0b3VsKCksIGFuZCBzaW1wbGVfc3RydG91bGwoKSBmdW5jdGlvbnMgZXhw
bGljaXRseSBpZ25vcmUKPiBvdmVyZmxvd3MsIHdoaWNoIG1heSBsZWFkIHRvIHVuZXhwZWN0ZWQg
cmVzdWx0cyBpbiBjYWxsZXJzLiIKPiBIZW5jZSwgdGhlIHVzZSBvZiB0aG9zZSBmdW5jdGlvbnMg
aXMgZGlzY291cmFnZWQuCj4KPiBUaGlzIHBhdGNoIHJlcGxhY2VzIGFsbCB1c2VzIG9mIHRoZSBz
aW1wbGVfc3RydG8qIHNlcmllcyBvZiBmdW5jdGlvbnMKPiB3aXRoIHRoZWlyIHNhZmVyIGtzdHJ0
byogYWx0ZXJuYXRpdmVzLgo+Cj4gU2lkZSBlZmZlY3RzIG9mIHRoaXMgcGF0Y2g6Cj4gLSBFdmVy
eSBzdHJpbmcgdG8gbG9uZyBvciBsb25nIGxvbmcgY29udmVyc2lvbiB1c2luZyBrc3RydG8qIGlz
IG5vdwo+ICAgY2hlY2tlZCBmb3IgZmFpbHVyZS4KPiAtIGtzdHJ0byogZXJyb3JzIGFyZSBoYW5k
bGVkIHdpdGggYXBwcm9wcmlhdGUgYEtEQl9CQURJTlRgIHdoZXJldmVyCj4gICBhcHBsaWNhYmxl
Lgo+IC0gQSBnb29kIHNpZGUgZWZmZWN0IGlzIHRoYXQgd2UgZW5kIHVwIHNhdmluZyBhIGZldyBs
aW5lcyBvZiBjb2RlCj4gICBzaW5jZSB1bmxpa2UgaW4gc2ltcGxlX3N0cnRvKiBmdW5jdGlvbnMs
IGtzdHJ0byBmdW5jdGlvbnMgZG8gbm90Cj4gICBuZWVkIGFuIGFkZGl0aW9uYWwgImVuZCBwb2lu
dGVyIiB2YXJpYWJsZSwgYW5kIHRoZSByZXR1cm4gdmFsdWVzCj4gICBvZiB0aGUgbGF0dGVyIGNh
biBiZSBkaXJlY3RseSBjaGVja2VkIGluIGFuICJpZiIgc3RhdGVtZW50IHdpdGhvdXQKPiAgIHRo
ZSBuZWVkIHRvIGRlZmluZSBhZGRpdGlvbmFsIGByZXRgIG9yIGBlcnJgIHZhcmlhYmxlcy4KPiAg
IFRoaXMsIG9mIGNvdXJzZSwgcmVzdWx0cyBpbiBjbGVhbmVyLCB5ZXQgc3RpbGwgZWFzeSB0byB1
bmRlcnN0YW5kCj4gICBjb2RlLgo+Cj4gWzFdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0
bWwvbGF0ZXN0L3Byb2Nlc3MvZGVwcmVjYXRlZC5odG1sI3NpbXBsZS1zdHJ0b2wtc2ltcGxlLXN0
cnRvbGwtc2ltcGxlLXN0cnRvdWwtc2ltcGxlLXN0cnRvdWxsCj4KPiBTaWduZWQtb2ZmLWJ5OiBZ
dXJhbiBQZXJlaXJhIDx5dXJhbi5wZXJlaXJhQGhvdG1haWwuY29tPgo+IFtuaXI6IGFkZHJlc3Nl
ZCByZXZpZXcgY29tbWVudHMgYnkgZml4aW5nIHN0eWxpbmcsIGludmFsaWQgY29udmVyc2lvbiBh
bmQgYSBtaXNzaW5nIGVycm9yIHJldHVybl0KPiBTaWduZWQtb2ZmLWJ5OiBOaXIgTGljaHRtYW4g
PG5pckBsaWNodG1hbi5vcmc+Cj4gLS0tCj4gIGtlcm5lbC9kZWJ1Zy9rZGIva2RiX21haW4uYyB8
IDY5ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIxIGluc2VydGlvbnMoKyksIDQ4IGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IERvdWds
YXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QK
S2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
