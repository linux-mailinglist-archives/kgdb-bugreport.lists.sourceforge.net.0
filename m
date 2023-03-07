Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E69316C69CA
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 23 Mar 2023 14:45:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pfLFr-0006F6-NW
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 23 Mar 2023 13:45:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brgl@bgdev.pl>) id 1pZZzi-0002k4-Cw
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 07 Mar 2023 16:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h9+99NXNhE+HCsau06muPJZBCwtg/6d76sJA1Z4GbtQ=; b=NwfVSiOoNJPQ57r+gWTNCLAbiA
 /zdm0q8sTPEpb0tPkWfAzj7sqNzz3xRO8tTwINW+nBuskEvvuZbpMasYPMx0O8b2rk8NJVwekoxJI
 y/a7dttT4ukrzOii11F7LUN/oBzri02pp0W/dxre7UVaRVkeBsrqCPI7hYdOdo2f7d6o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h9+99NXNhE+HCsau06muPJZBCwtg/6d76sJA1Z4GbtQ=; b=Ldf4nUM1zpm/3MooLSfIFrhXNN
 C6EtXZvTdHioR8BPhT9XNU8vG7mQXdCuiwVP0kA+sFLgKiBMqO6LGn2n3Vwd4b5Mbr2bnhLHzyfoA
 tK45o0SHKD18lPLC7GyZXEzbXIhY+aVyvJOPuyA2yHE+YgQ4H39gouzPfcOfVYQuIEh8=;
Received: from mail-lj1-f178.google.com ([209.85.208.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pZZzf-00070P-AT for kgdb-bugreport@lists.sourceforge.net;
 Tue, 07 Mar 2023 16:16:53 +0000
Received: by mail-lj1-f178.google.com with SMTP id b10so13779326ljr.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 07 Mar 2023 08:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678205805;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9+99NXNhE+HCsau06muPJZBCwtg/6d76sJA1Z4GbtQ=;
 b=EX1enJkIHCE4Jft6dHgd+TTBxYCsddhtYsmIqxOfIs7J6idEMG2Du9IQIH4UCKCeOk
 rSAubAr4K5TPojsZpND5rHJCXBE7cDhSOWZlwz8BCxQZTlzEF9FM+3vY53dqVCbnGdDW
 6dAELdl8p2wKzuZVBu6dUb6y3k9G+HfmoYmEUC+90nrnwdCX2b2gFIudOQPvCpDZvpwY
 oppckq1WKvl40RThgzcaq22mLx08CEh/x3o+fAbD3DegnFMQzaWRCFlKmlbNJ+cUZzCE
 jpe7pAgH8f+v20jYQyU7ceTloZUGfmPwtPt7E/GGJmylG+zm2RnSB9G668pSv/k/HAnx
 Xx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678205805;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h9+99NXNhE+HCsau06muPJZBCwtg/6d76sJA1Z4GbtQ=;
 b=PNhAOvma6IljxzGUOvluu4FpGqDHjyRj+cKh7shAScqc5cG1SwtJh4HsGunjSFhJxs
 CederaF/9aeqAQ2zq+dEFfpgD2gCGzOPd2TZa/e0OoU2lxSR9/lwy+f2i4NhJ6c+5cr7
 nWZtliWQVvIfgO6cdhkfaTFTf+H0pF0hkGRqH4ZjP9Hqew/jYrXbnroBOuieOqTgKfl1
 9gflZSpOYcr/gAkeVF5LejjkeUSlfg18jo39Pp/VEUn9koX+ilKQEdXptd7JPyQVGzG7
 tB03U1B8zXSLUv6J5IOuLqzG3tamPzRV4XEVgPkyewmYOFtsoId90hRHjBy/wuteW5Nj
 Bolw==
X-Gm-Message-State: AO0yUKV2a8U3058wklratqaAjcTvudUdQBqtmuYFnkhTd0nLPTLWpAPW
 BKPxHTmmLH+PcIquIvNh6IItsTTD425PpSwg8loi7fNxSvBm5PN/
X-Google-Smtp-Source: AK7set+EUPmmQ3KQEHGY3m5gS4LQmB5rlfTmCkgWLid5zxaXS4ZPk4vzmFfYMo7ea0TRMI75s5JFMj77XkpxSfOGbJ8=
X-Received: by 2002:a05:651c:1246:b0:295:b77c:a3a2 with SMTP id
 h6-20020a05651c124600b00295b77ca3a2mr4616438ljh.6.1678203976045; Tue, 07 Mar
 2023 07:46:16 -0800 (PST)
MIME-Version: 1.0
References: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
In-Reply-To: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 7 Mar 2023 16:46:03 +0100
Message-ID: <CAMRc=McL7P7Zr5csLtLVBj0DzuJ_M6OZZKeVQvpPCx1ytMk+=g@mail.gmail.com>
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
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.178 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.178 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1pZZzf-00070P-AT
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:45:22 +0000
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
Z29vZwo+CgpBbmQgYWxzbzoKClRlc3RlZC1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9z
ei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3Jl
cG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
