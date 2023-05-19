Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 599C370A94A
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:54:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0PqZ-0006ka-9N
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:54:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q03oT-0003od-7s
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GYXxQ1/HyN04Wnp4N53Q5scLF2D44b2WUzFjxPSR5OI=; b=gXhQzlubQwH6/AhO3HcgZA/5du
 bmVuBPmkuDNMtMJtf71JJxAtftBU0T5FFb4tQtpDgdro5bmw++wh/bEuoUi6CcNYByHdjLOpGpyyk
 jS6U7knl0gMKghv07jcQUN1H1/BIJKFYYw6jNb91W2P6x0cZqxJw+D9ELXkf3IHP3wQ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GYXxQ1/HyN04Wnp4N53Q5scLF2D44b2WUzFjxPSR5OI=; b=idYrt8ouXYmXzVDuT9bb+6/xqn
 Zbv9nZ7EjwHqFtRApjcXfQ1WOj/xgxj8PWsROgYuEWJ8uG6KKq8cMMEsDeZOD6I3Fr/YJTxd5Iaqo
 +62qCuMtrSRKHZQweONtG8s7ss5kAQRSKlqVWHECOXcAYZ3QITX2qpsK2HzsjZ20ndMg=;
Received: from mail-io1-f51.google.com ([209.85.166.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q03oP-00079F-O1 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:22:45 +0000
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-76c5749b10fso93504339f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684516954; x=1687108954;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GYXxQ1/HyN04Wnp4N53Q5scLF2D44b2WUzFjxPSR5OI=;
 b=cprx0a/OT1tOS4BZUKH+dEC/7iMeGXmwhKDss3dbIRbDhaHzFkxWgnuqBeoBbiL55s
 bzfX8ElhX5lnJIPUxWgHk0q95FgK1EwmQwspZC/mIQyN+zSRts9TfNOU+yi5G4BfV9kW
 w93Y8NzcqSCPhXN1H9puoU7H5CR5pqJ+PkXfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684516954; x=1687108954;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GYXxQ1/HyN04Wnp4N53Q5scLF2D44b2WUzFjxPSR5OI=;
 b=EhiFzvtSvoo8ViUQ3LcGSLD1W0dJsYZqBSItyrkfjKzpSfaiMjZUNNVP6C2yuY6lwt
 fhY2KUetHP/CH7n0rhVfQHJ/sVQQFGz7muodyyv9O8er6UElOQQW1RgOQxmhWN9RJAPa
 OD82okIQA9p8TczyLG17vZDi4EfJUMQzXfLgIGmQS3tFn4mco4mwLn7vqKWq75T/+ihh
 ijjyks/YEE8CpEwjpSnjYwtG5VRuoHSWqJGPghWEtZOiVxz9w/CvkbxxlNQY40w6LVK1
 6bZLszlaL8urmRPEq7/ADvyPd6DdlTxdk3RZ1hao8S/iywybzOUJA8bnReLMLXspkRvK
 qZHw==
X-Gm-Message-State: AC+VfDzScB7Nh9Aki9/Q/JALwQyaHFmUzUBunV/Sm5XmtSdX7hXpcIGl
 jEnpkoHDfGjILbA+fP3+8pEX2utUe7OYsLOWllE=
X-Google-Smtp-Source: ACHHUZ715JB8aURK03McyMI7hcIgfL1K8MV1XAFCZI0NvZ75nXiyjhL9CjxtmyqktE4qHo1QMmpltw==
X-Received: by 2002:a92:4a0a:0:b0:330:f026:4a8d with SMTP id
 m10-20020a924a0a000000b00330f0264a8dmr1684980ilf.22.1684516954750; 
 Fri, 19 May 2023 10:22:34 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com.
 [209.85.166.169]) by smtp.gmail.com with ESMTPSA id
 j24-20020a02a698000000b0041408b79f1esm1246813jam.111.2023.05.19.10.22.33
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 10:22:33 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-335d6260e9bso6135ab.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:22:33 -0700 (PDT)
X-Received: by 2002:a05:6e02:1c8c:b0:331:8db2:5d13 with SMTP id
 w12-20020a056e021c8c00b003318db25d13mr246620ill.8.1684516953136; Fri, 19 May
 2023 10:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.10.I00dfd6386ee00da25bf26d140559a41339b53e57@changeid>
 <ZF0NzSCRCapqDbC4@alley>
In-Reply-To: <ZF0NzSCRCapqDbC4@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 May 2023 10:22:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VXn07rgC=OUtHAz5v5h2g2gcrLCc5BYr6LMWFkyNKASw@mail.gmail.com>
Message-ID: <CAD=FV=VXn07rgC=OUtHAz5v5h2g2gcrLCc5BYr6LMWFkyNKASw@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Thu, May 11, 2023 at 8:46 AM Petr Mladek <pmladek@suse.com>
    wrote: > > > @@ -111,6 +125,11 @@ static void watchdog_hardlockup_interrupt_count(void)
    > > > > void watchdog_hardlockup_check(unsigned [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.51 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.51 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q03oP-00079F-O1
Subject: Re: [Kgdb-bugreport] [PATCH v4 10/17] watchdog/hardlockup: Move
 perf hardlockup watchdog petting to watchdog.c
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUaHUsIE1heSAxMSwgMjAyMyBhdCA4OjQ24oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFk
ZWtAc3VzZS5jb20+IHdyb3RlOgo+Cj4gPiBAQCAtMTExLDYgKzEyNSwxMSBAQCBzdGF0aWMgdm9p
ZCB3YXRjaGRvZ19oYXJkbG9ja3VwX2ludGVycnVwdF9jb3VudCh2b2lkKQo+ID4KPiA+ICB2b2lk
IHdhdGNoZG9nX2hhcmRsb2NrdXBfY2hlY2sodW5zaWduZWQgaW50IGNwdSwgc3RydWN0IHB0X3Jl
Z3MgKnJlZ3MpCj4gPiAgewo+ID4gKyAgICAgaWYgKF9fdGhpc19jcHVfcmVhZCh3YXRjaGRvZ19o
YXJkbG9ja3VwX3RvdWNoKSkgewo+ID4gKyAgICAgICAgICAgICBfX3RoaXNfY3B1X3dyaXRlKHdh
dGNoZG9nX2hhcmRsb2NrdXBfdG91Y2gsIGZhbHNlKTsKPiA+ICsgICAgICAgICAgICAgcmV0dXJu
Owo+ID4gKyAgICAgfQo+Cj4gSWYgd2UgY2xlYXIgd2F0Y2hkb2dfaGFyZGxvY2t1cF90b3VjaCgp
IGhlcmUgdGhlbgo+IHdhdGNoZG9nX2hhcmRsb2NrdXBfY2hlY2soKSB3b24ndCBiZSBjYWxsZWQg
eWV0IGFub3RoZXIKPiB3YXRjaGRvZ19ocnRpbWVyX3NhbXBsZV90aHJlc2hvbGQgcGVyaW9yLgo+
Cj4gSXQgbWVhbnMgdGhhdCBhbnkgdG91Y2ggd2lsbCBjYXVzZSBpZ25vcmluZyBvbmUgZnVsbCBw
ZXJpb2QuCj4gVGhlIGlzX2hhcmRsb2NrdXAoKSBjaGVjayB3aWxsIGJlIGRvbmUgYWZ0ZXIgZnVs
bCB0d28gcGVyaW9kcy4KPgo+IEl0IGlzIG5vdCBpZGVhbCwgc2VlIGJlbG93Lgo+Cj4gPiArCj4g
PiAgICAgICAvKgo+ID4gICAgICAgICogQ2hlY2sgZm9yIGEgaGFyZGxvY2t1cCBieSBtYWtpbmcg
c3VyZSB0aGUgQ1BVJ3MgdGltZXIKPiA+ICAgICAgICAqIGludGVycnVwdCBpcyBpbmNyZW1lbnRp
bmcuIFRoZSB0aW1lciBpbnRlcnJ1cHQgc2hvdWxkIGhhdmUKPiA+IGRpZmYgLS1naXQgYS9rZXJu
ZWwvd2F0Y2hkb2dfcGVyZi5jIGIva2VybmVsL3dhdGNoZG9nX3BlcmYuYwo+ID4gaW5kZXggOWJl
OTBiMmEyZWE3Li41NDc5MTdlYmQ1ZDMgMTAwNjQ0Cj4gPiAtLS0gYS9rZXJuZWwvd2F0Y2hkb2df
cGVyZi5jCj4gPiArKysgYi9rZXJuZWwvd2F0Y2hkb2dfcGVyZi5jCj4gPiBAQCAtMTEyLDExICs5
OCw2IEBAIHN0YXRpYyB2b2lkIHdhdGNoZG9nX292ZXJmbG93X2NhbGxiYWNrKHN0cnVjdCBwZXJm
X2V2ZW50ICpldmVudCwKPiA+ICAgICAgIC8qIEVuc3VyZSB0aGUgd2F0Y2hkb2cgbmV2ZXIgZ2V0
cyB0aHJvdHRsZWQgKi8KPiA+ICAgICAgIGV2ZW50LT5ody5pbnRlcnJ1cHRzID0gMDsKPiA+Cj4g
PiAtICAgICBpZiAoX190aGlzX2NwdV9yZWFkKHdhdGNoZG9nX25taV90b3VjaCkgPT0gdHJ1ZSkg
ewo+ID4gLSAgICAgICAgICAgICBfX3RoaXNfY3B1X3dyaXRlKHdhdGNoZG9nX25taV90b3VjaCwg
ZmFsc2UpOwo+ID4gLSAgICAgICAgICAgICByZXR1cm47Cj4gPiAtICAgICB9Cj4KPiBUaGUgb3Jp
Z2luYWwgY29kZSBsb29rcyB3cm9uZy4gYXJjaF90b3VjaF9ubWlfd2F0Y2hkb2coKSBjYXVzZWQK
PiBza2lwcGluZyBvbmx5IG9uZSBwZXJpb2Qgb2YgdGhlIHBlcmYgZXZlbnQuCj4KPiBJIHdvdWxk
IGV4cGVjdCB0aGF0IGl0IGNhdXNlZCByZXN0YXJ0aW5nIHRoZSBwZXJpb2QsCj4gc29tZXRoaW5n
IGxpa2U6Cj4KPiAgICAgICAgIGlmIChfX3RoaXNfY3B1X3JlYWQod2F0Y2hkb2dfbm1pX3RvdWNo
KSA9PSB0cnVlKSB7Cj4gICAgICAgICAgICAgICAgIC8qCj4gICAgICAgICAgICAgICAgICAqIFJl
c3RhcnQgdGhlIHBlcmlvZCBhZnRlciB3aGljaCB0aGUgaW50ZXJydXB0Cj4gICAgICAgICAgICAg
ICAgICAqIGNvdW50ZXIgaXMgY2hlY2tlZC4KPiAgICAgICAgICAgICAgICAgICovCj4gICAgICAg
ICAgICAgICAgIF9fdGhpc19jcHVfd3JpdGUobm1pX3JlYXJtZWQsIDApOwo+ICAgICAgICAgICAg
ICAgICBfX3RoaXNfY3B1X3dyaXRlKGxhc3RfdGltZXN0YW1wLCBub3cpOwo+ICAgICAgICAgICAg
ICAgICBfX3RoaXNfY3B1X3dyaXRlKHdhdGNoZG9nX25taV90b3VjaCwgZmFsc2UpOwo+ICAgICAg
ICAgICAgICAgICByZXR1cm47Cj4gICAgICAgICB9Cj4KPiBCeSBvdGhlciB3b3Jkcywgd2Ugc2hv
dWxkIHJlc3RhcnQgdGhlIHBlcmlvZCBpbiB0aGUgdmVyeSBuZXh0IHBlcmYKPiBldmVudCBhZnRl
ciB0aGUgd2F0Y2hkb2cgd2FzIHRvdWNoZWQuCj4KPiBUaGF0IHNhaWQsIHRoZSBuZXcgY29kZSBs
b29rcyBiZXR0ZXIgdGhhbiB0aGUgb3JpZ2luYWwuCj4gSU1ITywgdGhlIG9yaWdpbmFsIGNvZGUg
d2FzIHByb25lIHRvIGZhbHNlIHBvc2l0aXZlcy4KCkkgaGFkIGEgbGl0dGxlIGJpdCBvZiBhIGhh
cmQgdGltZSBmb2xsb3dpbmcsIGJ1dCBJIF90aGlua18gdGhlICJ0bDtkciIKb2YgYWxsIHRoZSBh
Ym92ZSBpcyB0aGF0IG15IGNoYW5nZSBpcyBmaW5lLiBJZiBJIG1pc3VuZGVyc3Rvb2QsIHBsZWFz
ZQp5ZWxsLgoKCj4gQmVzdCBSZWdhcmRzLAo+IFBldHIKPgo+IFBTOiBJdCBtaWdodCBiZSB3b3J0
aCBmaXhpbmcgdGhpcyBwcm9ibGVtIGluIGEgc2VwYXJhdGUgcGF0Y2ggYXQgdGhlCj4gICAgIGJl
Z2lubmluZyBvZiB0aGlzIHBhdGNoc2V0LiBJdCBtaWdodCBiZSBhIGNhbmRpZGF0ZSBmb3Igc3Rh
YmxlCj4gICAgIGJhY2twb3J0cy4KCkRvbmUuIEl0J3Mgbm93IGl0cyBvd24gcGF0Y2ggYW5kIGVh
cmx5IGluIHRoZSBzZXJpZXMuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
