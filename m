Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C3E6C69C9
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 23 Mar 2023 14:45:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pfLFr-0006Ew-DC
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 23 Mar 2023 13:45:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brgl@bgdev.pl>) id 1pZZoS-0002f0-5x
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 07 Mar 2023 16:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+PtH9Gk9ydTOUuCLXL03A9HQrmxm7UqvxGMXgnUBbiM=; b=HDQIqm84qilyLvJ3C839GnD3EP
 lvIrYcH+cbvvGzQ2MgGi6RHZjK770BTZaljluCyVuqTpIr0JzinzVSH6FAxA7C3iZuFUpZowCigrQ
 GL5qT84N5VW0HEkYLduXFPbB4bRLX/WKMDBWFW+oxrDjrpXJelNEWgFAf7GB8xg20uxo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+PtH9Gk9ydTOUuCLXL03A9HQrmxm7UqvxGMXgnUBbiM=; b=ES+/zxRh1BnormC1cigdsQGyPA
 KzqGc5u/1hpTKFbEbiOEPX+Wpw2BNvP8KN0p1x5NSeJub3fKmvfdQAUy4lTCbTzf98b5Mvob9ZDnv
 g3zlS0XSzuLb+OXeqUDUIx0cUr+Cc1iRBg25prfYUB4/p41D6sPljqBMtzeI3MPKeZRk=;
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pZZoP-0006dO-HO for kgdb-bugreport@lists.sourceforge.net;
 Tue, 07 Mar 2023 16:05:16 +0000
Received: by mail-ed1-f49.google.com with SMTP id k10so30379000edk.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 07 Mar 2023 08:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678205108;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+PtH9Gk9ydTOUuCLXL03A9HQrmxm7UqvxGMXgnUBbiM=;
 b=Vu+i/J8Aa/nOcfvDlvzi+xucdax+PjFPvXbsNLNDVVqLKkoTufBm2yG9cvXY3S4eJp
 255pHDqaf3g14KGQ1vhqUP4Tp09bld6ivw0AQnqjC6WO639OZuw3Z88qWME6zgx+gNQn
 pdYvd6fDvB49I0fu55kfczvimV4B2ZWM+S1UVr7kBaJH6GkQeGwa1UdE7fvpd4vUlyL+
 fx6SYSksUfAT7EpkwofOvMeIymBeN1w2ECsSv+afe6AP0AzUdPR7xaS3C3CB+t/AnmMw
 UwC9DtREEfHXQ1/1sba3ia21hwZgfd0XEXqvau6Fu/PAj6IMsLAMU9J8XapM30O6vSsZ
 c3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678205108;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+PtH9Gk9ydTOUuCLXL03A9HQrmxm7UqvxGMXgnUBbiM=;
 b=yrM0MZRC8Q4FMP0aC14aWhmY02/rkiOrcEDIOPb5mBzoFEfw1Q8aQ8FIkw95o6DYoq
 C3xdmmo+y2A6R/qnEQpFm9Lr/yS1dx6M9rEF/W4Oft5R50gUkabRlmhlb0zD9VqXtw1r
 IaPddC/JO5y/+DKdlGOIcv7jA6+s9IQtmj0Y30nynbakYncwPqbqeqgoX4PdBHM/Es3B
 XgpDCkCph6hbv8l1b5obPhl8NaVhu783/hiYZF/sHPGGVS2vsvRgyzO16oy3LoeqBf7y
 ZkQrLrQVEYWWgXS4ciWBpg64FlJQ/xF9x9unP8zzBzN7Ec4OGS7bzAz5l1AswImf48OI
 wsBA==
X-Gm-Message-State: AO0yUKVedK3kn/FMrJDfc25ZaZlbEoMA4cMsnj7Yi2oPma5iwIOgqaH+
 l7UwlGVkgvV0vxM+9dWiLYKUgUba4ZAilXuoP6XbIni7rU6foCSF
X-Google-Smtp-Source: AK7set/sxMp2nymcDtGOA+3rKK9UwGmZwcMpf7ztw0lEMN+8H5sNhHbCwoz5CimvcW51n/7crDGpnBESVibPIo32sWU=
X-Received: by 2002:ac2:43a6:0:b0:4db:3ab2:896e with SMTP id
 t6-20020ac243a6000000b004db3ab2896emr4355849lfl.6.1678203532966; Tue, 07 Mar
 2023 07:38:52 -0800 (PST)
MIME-Version: 1.0
References: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
In-Reply-To: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 7 Mar 2023 16:38:21 +0100
Message-ID: <CAMRc=MdKmDQGj_tWJhFMtOW3bGJWu4gqjL40BbCbP-Or5epVZA@mail.gmail.com>
To: Douglas Anderson <dianders@chromium.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Mar 7, 2023 at 4:33 PM Douglas Anderson <dianders@chromium.org>
    wrote: > > Commit d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations
    > in progress at shutdown") was basically a st [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.49 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.49 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1pZZoP-0006dO-HO
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:45:19 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 1/3] tty: serial: qcom-geni-serial: Fix
 kdb/kgdb after port shutdown (again)
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gVHVlLCBNYXIgNywgMjAyMyBhdCA0OjMz4oCvUE0gRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRl
cnNAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IENvbW1pdCBkOGFjYTJmOTY4MTMgKCJ0dHk6IHNl
cmlhbDogcWNvbS1nZW5pLXNlcmlhbDogc3RvcCBvcGVyYXRpb25zCj4gaW4gcHJvZ3Jlc3MgYXQg
c2h1dGRvd24iKSB3YXMgYmFzaWNhbGx5IGEgc3RyYWlnaHQgcmV2ZXJ0IG9mIHRoZQo+IGNvbW1p
dCBpdCBjbGFpbXMgdG8gZml4IHdpdGhvdXQgYW55IGV4cGxhbmF0aW9uIG9mIHdoeSB0aGUgcHJv
YmxlbXMKPiB0YWxrZWQgYWJvdXQgaW4gdGhlIG9yaWdpbmFsIHBhdGNoIHdlcmUgbm8gbG9uZ2Vy
IHJlbGV2YW50LiBJbmRlZWQsCj4gY29tbWl0IGQ4YWNhMmY5NjgxMyAoInR0eTogc2VyaWFsOiBx
Y29tLWdlbmktc2VyaWFsOiBzdG9wIG9wZXJhdGlvbnMKPiBpbiBwcm9ncmVzcyBhdCBzaHV0ZG93
biIpIHJlLWludHJvZHVjZXMgdGhlIHNhbWUgcHJvYmxlbSB0aGF0IGNvbW1pdAo+IGU4Mzc2NjMz
NGY5NiAoInR0eTogc2VyaWFsOiBxY29tX2dlbmlfc2VyaWFsOiBObyBuZWVkIHRvIHN0b3AgdHgv
cnggb24KPiBVQVJUIHNodXRkb3duIikgZml4ZWQuCj4KPiBUaGUgcHJvYmxlbXMgYXJlIHZlcnkg
ZWFzeSB0byBzZWUgYnkgc2ltcGx5IGRvaW5nIHRoaXMgb24gYQo+IHNjNzE4MC1iYXNlZCBDaHJv
bWVib29rOgo+Cj4gMS4gQm9vdCBpbiBkZXZlbG9wZXIgbW9kZSB3aXRoIHNlcmlhbCBjb25zb2xl
IGVuYWJsZWQgYW5kIGtkYiBzZXR1cCBvbgo+ICAgIHRoZSBzZXJpYWwgY29uc29sZS4KPiAyLiB2
aWEgc3NoOiBzdG9wIGNvbnNvbGUtdHR5TVNNMDsgZWNobyBnID4gL3Byb2Mvc3lzcnEtdHJpZ2dl
cgo+Cj4gV2hlbiB5b3UgZG8gdGhlIGFib3ZlIHlvdSdsbCBzZWUgdGhlICJrZGIiIHByb21wdCBw
cmludGVkIG9uIHRoZQo+IHNlcmlhbCBjb25zb2xlIGJ1dCBiZSB1bmFibGUgdG8gaW50ZXJhY3Qg
d2l0aCBpdC4KPgo+IExldCdzIGZpeCB0aGUgcHJvYmxlbSBhZ2FpbiBieSBub3RpbmcgdGhhdCB0
aGUgY29uc29sZSBwb3J0IGlzIG5ldmVyCj4gY29uZmlndXJlZCBpbiBETUEgbW9kZSBhbmQgdGh1
cyB3ZSBkb24ndCBuZWVkIHRvIHN0b3AgdGhpbmdzIGZvciB0aGUKPiBjb25zb2xlLgo+Cj4gRml4
ZXM6IGQ4YWNhMmY5NjgxMyAoInR0eTogc2VyaWFsOiBxY29tLWdlbmktc2VyaWFsOiBzdG9wIG9w
ZXJhdGlvbnMgaW4gcHJvZ3Jlc3MgYXQgc2h1dGRvd24iKQo+IFNpZ25lZC1vZmYtYnk6IERvdWds
YXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPiAtLS0KPgo+ICBkcml2ZXJzL3R0
eS9zZXJpYWwvcWNvbV9nZW5pX3NlcmlhbC5jIHwgNiArKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3R0eS9zZXJpYWwvcWNvbV9nZW5pX3NlcmlhbC5jIGIvZHJpdmVycy90dHkvc2VyaWFsL3Fjb21f
Z2VuaV9zZXJpYWwuYwo+IGluZGV4IGQ2OTU5MmU1ZTJlYy4uNzRhMGUwNzRjMmRlIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9xY29tX2dlbmlfc2VyaWFsLmMKPiArKysgYi9kcml2
ZXJzL3R0eS9zZXJpYWwvcWNvbV9nZW5pX3NlcmlhbC5jCj4gQEAgLTEwNzAsOCArMTA3MCwxMCBA
QCBzdGF0aWMgaW50IHNldHVwX2ZpZm9zKHN0cnVjdCBxY29tX2dlbmlfc2VyaWFsX3BvcnQgKnBv
cnQpCj4gIHN0YXRpYyB2b2lkIHFjb21fZ2VuaV9zZXJpYWxfc2h1dGRvd24oc3RydWN0IHVhcnRf
cG9ydCAqdXBvcnQpCj4gIHsKPiAgICAgICAgIGRpc2FibGVfaXJxKHVwb3J0LT5pcnEpOwo+IC0g
ICAgICAgcWNvbV9nZW5pX3NlcmlhbF9zdG9wX3R4KHVwb3J0KTsKPiAtICAgICAgIHFjb21fZ2Vu
aV9zZXJpYWxfc3RvcF9yeCh1cG9ydCk7Cj4gKyAgICAgICBpZiAoIXVhcnRfY29uc29sZSh1cG9y
dCkpIHsKPiArICAgICAgICAgICAgICAgcWNvbV9nZW5pX3NlcmlhbF9zdG9wX3R4KHVwb3J0KTsK
PiArICAgICAgICAgICAgICAgcWNvbV9nZW5pX3NlcmlhbF9zdG9wX3J4KHVwb3J0KTsKPiArICAg
ICAgIH0KPiAgfQo+Cj4gIHN0YXRpYyBpbnQgcWNvbV9nZW5pX3NlcmlhbF9wb3J0X3NldHVwKHN0
cnVjdCB1YXJ0X3BvcnQgKnVwb3J0KQo+IC0tCj4gMi40MC4wLnJjMC4yMTYuZ2M0MjQ2YWQwZjAt
Z29vZwo+CgpIZXkgRG91Z2xhcywKClRoYW5rcyBmb3IgdGhpcywgSSB3YXMgYWJvdXQgdG8gcG9z
dCBhIHNpbWlsYXIgZml4LCB0aGlzIHdhcyByZXBvcnRlZAp0byBtZSBieSB0d28gb3RoZXIgcGVv
cGxlLgoKUmV2aWV3ZWQtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdz
a2lAbGluYXJvLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2tnZGItYnVncmVwb3J0Cg==
