Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F4270FE9F
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 May 2023 21:40:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q1uKx-0004lY-Bw
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 24 May 2023 19:39:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q1uKO-0004lN-Gr
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 May 2023 19:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XIB0HReKptcGBTosdBXg1PO+NrPRx+I4udNpoc6AMN0=; b=WYz2PbWJOoJ3a7IdNF0ydeimfj
 qYwpCjz/cVxCuYym0UFONHCX5wRbZueL3aWORGfqWQZQqUos4CmU6iKXLydSUGFnuFNswrUMmVHbX
 eSw1YoZFxxCvpW95d7SJTqA2T7L8JcknTpdwEkJc6qu2vqj6ZGBcXK5OIYzuZ/SquAkg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XIB0HReKptcGBTosdBXg1PO+NrPRx+I4udNpoc6AMN0=; b=EHiiMah32pQE4U8Vjho1n08Xix
 Mjvc/01UFp59LPkhfBJVEHNpEc+RjPRr+RwpsfeDAyFA3LHILRBvZ6g3mxuLOQHcORgg8Ue6rk1ES
 1/jlfcvEIxXxN8olyOHCxTrpS7EfLilSHBBvPZX6El0qUlGcXaQ/J4R9YSgaL+rfhh9o=;
Received: from mail-io1-f49.google.com ([209.85.166.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q1uKG-0003nS-IT for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 May 2023 19:39:16 +0000
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7748c901812so37485239f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 24 May 2023 12:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684957145; x=1687549145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XIB0HReKptcGBTosdBXg1PO+NrPRx+I4udNpoc6AMN0=;
 b=V2lnKHvyL6puhQYWDKidJ9xM8y51Y9qTYPhiu08GMj5yQTMJKQlI8fNKYBuCw5OxQ4
 pvwWB8gHd0DWfjhNSg9EkN1QuEi9L5Bu7dJtGVs3JKDtWDs+CNQjq6mj6FphCtNjQPfm
 mu82ExkpsMg0Fdps04jES/Hrw7T47YnrnEeuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684957145; x=1687549145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XIB0HReKptcGBTosdBXg1PO+NrPRx+I4udNpoc6AMN0=;
 b=RLZSgWJdWnIV91zHsGfyVuXHxE80MQxGkH57J0hO/Drvchd8mDyZX+AjTdRdfFP2pN
 ZidgyQVkZwLBQqyUgFDSuNo5Q1If3nNSI6RAKyLND6EtRfVf8xH19HL9R/42Tn7KKNju
 lvxF7iKJ24rjCEiCt+Iw/Q8GKHmr/qLqdkErBD+vexqCyqMGN7MCP6+0WNPpQOwg/ZQ1
 rDjmx+cirWfiQ5wtwca5hNcKd99ugzSBBlZ07ST9qLFtyNWLPbHUgKRZo/6SWEyplZX9
 x2f6gynsW0bjoQ2A1OgFfwJxD3/5KGNAJs9GmE70Qr1CFNMSXM/97jhrCGC/v3R2PDVp
 BPJA==
X-Gm-Message-State: AC+VfDwU381jWOdaC8BokHO3n3P8Urc5zWQG7GL0GunRUg+/nVtPyVjv
 REpQrXXNQXGlTTo72O5nEmj74WDMrFoSAgh9zQM=
X-Google-Smtp-Source: ACHHUZ6P22XuNKzbZ4u2HbvuEp2jPxRnhReYuoQfYTz7mjjuGdaqdZtbs+zAL0SMSCjR5Z3izJW/aw==
X-Received: by 2002:a5d:8e17:0:b0:76c:65df:a118 with SMTP id
 e23-20020a5d8e17000000b0076c65dfa118mr11148613iod.6.1684957145028; 
 Wed, 24 May 2023 12:39:05 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177]) by smtp.gmail.com with ESMTPSA id
 s11-20020a6b740b000000b00763699c3d02sm3560444iog.0.2023.05.24.12.39.03
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 12:39:04 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-33a8f766b64so1105ab.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 24 May 2023 12:39:03 -0700 (PDT)
X-Received: by 2002:a05:6e02:194e:b0:331:d42:d06e with SMTP id
 x14-20020a056e02194e00b003310d42d06emr33974ilu.17.1684957143210; Wed, 24 May
 2023 12:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.13.I847d9ec852449350997ba00401d2462a9cb4302b@changeid>
 <ZG4YMyifGLOBJxLo@alley>
In-Reply-To: <ZG4YMyifGLOBJxLo@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 May 2023 12:38:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+LEcSrArV+w35MX4oP1sC9KoRM0puJLT1RFmyS84Hxw@mail.gmail.com>
Message-ID: <CAD=FV=X+LEcSrArV+w35MX4oP1sC9KoRM0puJLT1RFmyS84Hxw@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, May 24, 2023 at 6:59 AM Petr Mladek <pmladek@suse.com>
    wrote: > > On Fri 2023-05-19 10:18:37, Douglas Anderson wrote: > > The fact
    that there watchdog_hardlockup_enable(), > > watchdog_hardl [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.49 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q1uKG-0003nS-IT
Subject: Re: [Kgdb-bugreport] [PATCH v5 13/18] watchdog/hardlockup: Have the
 perf hardlockup use __weak functions more cleanly
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
 ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, christophe.leroy@csgroup.eu,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mpe@ellerman.id.au, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIE1heSAyNCwgMjAyMyBhdCA2OjU54oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFk
ZWtAc3VzZS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpIDIwMjMtMDUtMTkgMTA6MTg6MzcsIERvdWds
YXMgQW5kZXJzb24gd3JvdGU6Cj4gPiBUaGUgZmFjdCB0aGF0IHRoZXJlIHdhdGNoZG9nX2hhcmRs
b2NrdXBfZW5hYmxlKCksCj4gPiB3YXRjaGRvZ19oYXJkbG9ja3VwX2Rpc2FibGUoKSwgYW5kIHdh
dGNoZG9nX2hhcmRsb2NrdXBfcHJvYmUoKSBhcmUKPiA+IGRlY2xhcmVkIF9fd2VhayBtZWFucyB0
aGF0IHRoZSBjb25maWd1cmVkIGhhcmRsb2NrdXAgZGV0ZWN0b3IgY2FuCj4gPiBkZWZpbmUgbm9u
LXdlYWsgdmVyc2lvbnMgb2YgdGhvc2UgZnVuY3Rpb25zIGlmIGl0IG5lZWRzIHRvLiBJbnN0ZWFk
IG9mCj4gPiBkb2luZyB0aGlzLCB0aGUgcGVyZiBoYXJkbG9ja3VwIGRldGVjdG9yIGhvb2tlZCBp
dHNlbGYgaW50byB0aGUKPiA+IGRlZmF1bHQgX193ZWFrIGltcGxlbWVudGF0aW9uLCB3aGljaCB3
YXMgYSBiaXQgYXdrd2FyZC4gQ2xlYW4gdGhpcyB1cC4KPiA+Cj4gPiA+RnJvbSBjb21tZW50cywg
aXQgbG9va3MgYXMgaWYgdGhlIG9yaWdpbmFsIGRlc2lnbiB3YXMgZG9uZSBiZWNhdXNlIHRoZQo+
ID4gX193ZWFrIGZ1bmN0aW9uIHdlcmUgZXhwZWN0ZWQgdG8gaW1wbGVtZW50ZWQgYnkgdGhlIGFy
Y2hpdGVjdHVyZSBhbmQKPiA+IG5vdCBieSB0aGUgY29uZmlndXJlZCBoYXJkbG9ja3VwIGRldGVj
dG9yLiBUaGlzIGdvdCBhd2t3YXJkIHdoZW4gd2UKPiA+IHRyaWVkIHRvIGFkZCB0aGUgYnVkZHkg
bG9ja3VwIGRldGVjdG9yIHdoaWNoIHdhcyBub3QgYXJjaC1zcGVjaWZpYyBidXQKPiA+IHdhbnRl
ZCB0byBob29rIGludG8gdGhvc2Ugc2FtZSBmdW5jdGlvbnMuCj4gPgo+ID4gVGhpcyBpcyBub3Qg
ZXhwZWN0ZWQgdG8gaGF2ZSBhbnkgZnVuY3Rpb25hbCBpbXBhY3QuCj4gPgo+ID4gQEAgLTE4Nywy
NyArMTg3LDMzIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB3YXRjaGRvZ19oYXJkbG9ja3VwX2tpY2so
dm9pZCkgeyB9Cj4gPiAgI2VuZGlmIC8qICFDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJG
ICovCj4gPgo+ID4gIC8qCj4gPiAtICogVGhlc2UgZnVuY3Rpb25zIGNhbiBiZSBvdmVycmlkZGVu
IGlmIGFuIGFyY2hpdGVjdHVyZSBpbXBsZW1lbnRzIGl0cwo+ID4gLSAqIG93biBoYXJkbG9ja3Vw
IGRldGVjdG9yLgo+ID4gKyAqIFRoZXNlIGZ1bmN0aW9ucyBjYW4gYmUgb3ZlcnJpZGRlbiBiYXNl
ZCBvbiB0aGUgY29uZmlndXJlZCBoYXJkbG9ja2R1cCBkZXRlY3Rvci4KPiA+ICAgKgo+ID4gICAq
IHdhdGNoZG9nX2hhcmRsb2NrdXBfZW5hYmxlL2Rpc2FibGUgY2FuIGJlIGltcGxlbWVudGVkIHRv
IHN0YXJ0IGFuZCBzdG9wIHdoZW4KPiA+IC0gKiBzb2Z0bG9ja3VwIHdhdGNoZG9nIHN0YXJ0IGFu
ZCBzdG9wLiBUaGUgYXJjaCBtdXN0IHNlbGVjdCB0aGUKPiA+ICsgKiBzb2Z0bG9ja3VwIHdhdGNo
ZG9nIHN0YXJ0IGFuZCBzdG9wLiBUaGUgZGV0ZWN0b3IgbXVzdCBzZWxlY3QgdGhlCj4gPiAgICog
U09GVExPQ0tVUF9ERVRFQ1RPUiBLY29uZmlnLgo+ID4gICAqLwo+ID4gLXZvaWQgX193ZWFrIHdh
dGNoZG9nX2hhcmRsb2NrdXBfZW5hYmxlKHVuc2lnbmVkIGludCBjcHUpCj4gPiAtewo+ID4gLSAg
ICAgaGFyZGxvY2t1cF9kZXRlY3Rvcl9wZXJmX2VuYWJsZSgpOwo+ID4gLX0KPiA+ICt2b2lkIF9f
d2VhayB3YXRjaGRvZ19oYXJkbG9ja3VwX2VuYWJsZSh1bnNpZ25lZCBpbnQgY3B1KSB7IH0KPiA+
Cj4gPiAtdm9pZCBfX3dlYWsgd2F0Y2hkb2dfaGFyZGxvY2t1cF9kaXNhYmxlKHVuc2lnbmVkIGlu
dCBjcHUpCj4gPiAtewo+ID4gLSAgICAgaGFyZGxvY2t1cF9kZXRlY3Rvcl9wZXJmX2Rpc2FibGUo
KTsKPiA+IC19Cj4gPiArdm9pZCBfX3dlYWsgd2F0Y2hkb2dfaGFyZGxvY2t1cF9kaXNhYmxlKHVu
c2lnbmVkIGludCBjcHUpIHsgfQo+ID4KPiA+ICAvKiBSZXR1cm4gMCwgaWYgYSBoYXJkbG9ja3Vw
IHdhdGNoZG9nIGlzIGF2YWlsYWJsZS4gRXJyb3IgY29kZSBvdGhlcndpc2UgKi8KPiA+ICBpbnQg
X193ZWFrIF9faW5pdCB3YXRjaGRvZ19oYXJkbG9ja3VwX3Byb2JlKHZvaWQpCj4gPiAgewo+ID4g
LSAgICAgcmV0dXJuIGhhcmRsb2NrdXBfZGV0ZWN0b3JfcGVyZl9pbml0KCk7Cj4gPiArICAgICAv
Kgo+ID4gKyAgICAgICogSWYgQ09ORklHX0hBVkVfTk1JX1dBVENIRE9HIGlzIGRlZmluZWQgdGhl
biBhbiBhcmNoaXRlY3R1cmUKPiA+ICsgICAgICAqIGlzIGFzc3VtZWQgdG8gaGF2ZSB0aGUgaGFy
ZCB3YXRjaGRvZyBhdmFpbGFibGUgYW5kIHdlIHJldHVybiAwLgo+ID4gKyAgICAgICovCj4gPiAr
ICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfSEFWRV9OTUlfV0FUQ0hET0cpKQo+ID4gKyAgICAg
ICAgICAgICByZXR1cm4gMDsKPiA+ICsKPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBIYXJkbG9j
a3VwIGRldGVjdG9ycyBvdGhlciB0aGFuIHRob3NlIHVzaW5nIENPTkZJR19IQVZFX05NSV9XQVRD
SERPRwo+ID4gKyAgICAgICogYXJlIHJlcXVpcmVkIHRvIGltcGxlbWVudCBhIG5vbi13ZWFrIHZl
cnNpb24gb2YgdGhpcyBwcm9iZSBmdW5jdGlvbgo+ID4gKyAgICAgICogdG8gdGVsbCB3aGV0aGVy
IHRoZXkgYXJlIGF2YWlsYWJsZS4gSWYgdGhleSBkb24ndCBvdmVycmlkZSB0aGVuCj4gPiArICAg
ICAgKiB3ZSdsbCByZXR1cm4gLUVOT0RFVi4KPiA+ICsgICAgICAqLwo+ID4gKyAgICAgcmV0dXJu
IC1FTk9ERVY7Cj4gPiAgfQo+Cj4gV2hlbiB0aGlua2luZyBtb3JlIGFib3V0IGl0LiBJdCBpcyB3
ZWlyZCB0aGF0IHdlIG5lZWQgdG8gaGFuZGxlCj4gQ09ORklHX0hBVkVfTk1JX1dBVENIRE9HIGlu
IHRoaXMgZGVmYXVsdCB3ZWVrIGZ1bmN0aW9uLgo+Cj4gSXQgc2hvdWxkIGJlIGhhbmRsZWQgaW4g
d2F0Y2hkb2dfaGFyZGxvY2t1cF9wcm9iZSgpIGltcGxlbWVudGVkCj4gaW4ga2VybmVsL3dhdGNo
ZG9nX3BlcmYuYy4KPgo+IElNSE8sIHRoZSBkZWZhdWx0IF9fd2VhayBmdW5jdGlvbiBjb3VsZCBh
bHdheXMgcmV0dXJuIC1FTk9ERVY7Cj4KPiBXb3VsZCBpdCBtYWtlIHNlbnNlLCBwbGVhc2U/CgpJ
IGRvbid0IHF1aXRlIHVuZGVyc3RhbmQuIEknZCBhZ3JlZSB0aGF0IHRoZSBzcGVjaWFsIGNhc2Ug
Zm9yCkNPTkZJR19IQVZFX05NSV9XQVRDSERPRyBpcyB1Z2x5LCBidXQgaXQgd2FzIGFsc28gdWds
eSBiZWZvcmUuIElNTwppdCdzIGFjdHVhbGx5IGEgbGl0dGxlIGxlc3MgdWdseSAvIGVhc2llciB0
byB1bmRlcnN0YW5kIGFmdGVyIG15CnBhdGNoLiAuLi5idXQgbGV0IG1lIHdhbGsgdGhyb3VnaCBo
b3cgSSB0aGluayB0aGlzIHNwZWNpYWwgY2FzZSB3b3JrcwphbmQgbWF5YmUgeW91IGNhbiB0ZWxs
IG1lIHdoZXJlIEknbSBjb25mdXNlZC4KClRoZSBmaXJzdCB0aGluZyB0byB1bmRlcnN0YW5kIGlz
IHRoYXQgQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1JfUEVSRgphbmQgQ09ORklHX0hBVkVfTk1J
X1dBVENIRE9HIGFyZSBtdXR1YWxseSBleGNsdXNpdmUgZnJvbSBlYWNoIG90aGVyLgpUaGlzIHdh
cyB0cnVlIGJlZm9yZSBhbnkgb2YgbXkgcGF0Y2hlcyBhbmQgaXMgc3RpbGwgdHJ1ZSBhZnRlciB0
aGVtLgpTcGVjaWZpY2FsbHksIGlmIENPTkZJR19IQVZFX05NSV9XQVRDSERPRyBpcyBkZWZpbmVk
IHRoZW4gYW4KYXJjaGl0ZWN0dXJlIGltcGxlbWVudHMgYXJjaF90b3VjaF9ubWlfd2F0Y2hkb2co
KSAoYXMgZG9jdW1lbnRlZCBpbgp0aGUgS2NvbmZpZyBkb2NzIGZvciBIQVZFX05NSV9XQVRDSERP
RykuIExvb2tpbmcgYXQgdGhlIHRyZWUgYmVmb3JlIG15CnNlcmllcyB5b3UgY2FuIHNlZSB0aGF0
IHRoZSBwZXJmIGhhcmRsb2NrdXAgZGV0ZWN0b3IgYWxzbyBpbXBsZW1lbnRlZAphcmNoX3RvdWNo
X25taV93YXRjaGRvZygpLiBUaGlzIHdvdWxkIGhhdmUgY2F1c2VkIGEgY29uZmxpY3QuIFRoZQpt
dXR1YWwgZXhjbHVzaW9uIHdhcyBwcmVzdW1hYmx5IGVuZm9yY2VkIGJ5IGFuIGFyY2hpdGVjdHVy
ZSBub3QKZGVmaW5pbmcgYm90aCBIQVZFX05NSV9XQVRDSERPRyBhbmQgSEFWRV9IQVJETE9DS1VQ
X0RFVEVDVE9SX1BFUkYuCgpUaGUgc2Vjb25kIHRoaW5nIHRvIHVuZGVyc3RhbmQgaXMgdGhhdCBh
biBhcmNoaXRlY3R1cmUgdGhhdCBkZWZpbmVzCkNPTkZJR19IQVZFX05NSV9XQVRDSERPRyBpcyBf
bm90XyByZXF1aXJlZCB0byBpbXBsZW1lbnQKd2F0Y2hkb2dfaGFyZGxvY2t1cF9wcm9iZSgpICh1
c2VkIHRvIGJlIGNhbGxlZCB3YXRjaGRvZ19ubWlfcHJvYmUoKSkuCk1heWJlIHRoaXMgc2hvdWxk
IGNoYW5nZSwgYnV0IGF0IHRoZSB2ZXJ5IGxlYXN0IGl0IGFwcGVhcnMgdGhhdApTUEFSQzY0IGRl
ZmluZXMgSEFWRV9OTUlfV0FUQ0hET0cgYnV0IGRvZXNuJ3QgZGVmaW5lCndhdGNoZG9nX2hhcmRs
b2NrdXBfcHJvYmUoKSBBS0Egd2F0Y2hkb2dfbm1pX3Byb2JlKCkuIEFueW9uZSB3aG8KZGVmaW5l
cyBDT05GSUdfSEFWRV9OTUlfV0FUQ0hET0cgYW5kIGRvZXNuJ3QgaW1wbGVtZW50CndhdGNoZG9n
X2hhcmRsb2NrdXBfcHJvYmUoKSBpcyBjbGFpbWluZyB0aGF0IHRoZWlyIHdhdGNoZG9nIG5lZWRz
IG5vCnByb2JpbmcgYW5kIGlzIGFsd2F5cyBhdmFpbGFibGUuCgpTbyB3aXRoIHRoYXQgY29udGV4
dDoKCjEuIFdlIGNhbid0IGhhbmRsZSBhbnkgc3BlY2lhbCBjYXNlcyBmb3IgQ09ORklHX0hBVkVf
Tk1JX1dBVENIRE9HIGluCiJrZXJuZWwvd2F0Y2hkb2dfcGVyZi5jIi4gVGhlIHNwZWNpYWwgY2Fz
ZXMgdGhhdCB3ZSBuZWVkIHRvIGhhbmRsZSBhcmUKYWxsIGZvciB0aGUgY2FzZXMgd2hlcmUgQ09O
RklHX0hBUkRMT0NLVVBfREVURUNUT1JfUEVSRiBpc24ndCBkZWZpbmVkCmFuZCB0aGF0IG1lYW5z
ICJrZXJuZWwvd2F0Y2hkb2dfcGVyZi5jIiBpc24ndCBpbmNsdWRlZC4KCjIuIFdlIGNhbid0IGhh
dmUgdGhlIGRlZmF1bHQgX193ZWFrIGZ1bmN0aW9uIHJldHVybiAtRU5PREVWIGJlY2F1c2UKQ09O
RklHX0hBVkVfTk1JX1dBVENIRE9HIGRvZXNuJ3QgcmVxdWlyZSBhbiBhcmNoIHRvIGltcGxlbWVu
dAp3YXRjaGRvZ19oYXJkbG9ja3VwX3Byb2JlKCksIGJ1dCB3ZSB3YW50IHdhdGNoZG9nX2hhcmRs
b2NrdXBfcHJvYmUoKQp0byByZXR1cm4gIm5vIGVycm9yIiBpbiB0aGF0IGNhc2Ugc28gdGhhdAoi
d2F0Y2hkb2dfaGFyZGxvY2t1cF9hdmFpbGFibGUiIGdldHMgc2V0IHRvIHRydWUuCgpEb2VzIHRo
YXQgc291bmQgcmlnaHQ/CgpJJ2QgYWdyZWUgdGhhdCBhIGZ1dHVyZSBpbXByb3ZlbWVudCBzYXlp
bmcgdGhhdApDT05GSUdfSEFWRV9OTUlfV0FUQ0hET0cgbWVhbnMgeW91IF9tdXN0XyBpbXBsZW1l
bnQKd2F0Y2hkb2dfaGFyZGxvY2t1cF9wcm9iZSgpIHdvdWxkIG1ha2Ugc2Vuc2UgYW5kIHRoYXQg
d291bGQgYWxsb3cgdXMKdG8gZ2V0IHJpZCBvZiB0aGUgc3BlY2lhbCBjYXNlLiBJTU8sIHRob3Vn
aCwgdGhhdCdzIGEgc2VwYXJhdGUgcGF0Y2guCkknZCBiZSBoYXBweSB0byByZXZpZXcgdGhhdCBw
YXRjaCBpZiB5b3Ugd2FudGVkIHRvIHBvc3QgaXQgdXAuIDotKQoKSWYgd2Ugd2FudCB0byBhZGQg
dGhhdCByZXF1aXJlbWVudCwgSSBfdGhpbmtfIHRoZSBvbmx5IHRoaW5nIHlvdSdkCm5lZWQgdG8g
ZG8gaXMgdG8gYWRkIHdhdGNoZG9nX2hhcmRsb2NrdXBfcHJvYmUoKSB0byBzcGFyYzY0IGFuZCBo
YXZlCml0IHJldHVybiAwIGFuZCBwdXQgdGhhdCBkZWZpbml0aW9uIGluIHRoZSBzYW1lIGZpbGUg
Y29udGFpbmluZwphcmNoX3RvdWNoX25taV93YXRjaGRvZygpLiBwb3dlcnBjIGFsc28gZ2V0cyBD
T05GSUdfSEFWRV9OTUlfV0FUQ0hET0cKYXMgYSBzaWRlIGVmZmVjdCBvZiBzZWxlY3RpbmcgQ09O
RklHX0hBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9BUkNIIGJ1dAppdCBsb29rcyBsaWtlIHRoZXkg
aW1wbGVtZW50IHdhdGNoZG9nX2hhcmRsb2NrdXBfcHJvYmUoKSBhbHJlYWR5LiBPaCwKYnV0IG1h
eWJlIHRoaXMgd2lsbCBmaXggYSBwcmVleGlzdGluZyAoZXhpc3RlZCBiZWZvcmUgbXkgcGF0Y2hl
cykKbWlub3IgYnVnLi4uIFVubGVzcyBJJ20gbWlzc2luZyBzb21ldGhpbmcgKGVudGlyZWx5IHBv
c3NpYmxlISkgb24KcG93ZXJwYyB0b2RheSBJIGd1ZXNzIGlmIHlvdSB0dXJuIG9mZiBDT05GSUdf
UFBDX1dBVENIRE9HIHRoZW4KQ09ORklHX0hBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9BUkNIIGFu
ZCBDT05GSUdfSEFWRV9OTUlfV0FUQ0hET0cKd291bGQgc3RpbGwgYmUgZGVmaW5lZCBhbmQgd2Un
ZCBlbmQgdXAgcmV0dXJuaW5nIDAgKG5vIGVycm9yKSBmcm9tCndhdGNoZG9nX2hhcmRsb2NrdXBf
cHJvYmUoKS4gVGhhdCBtZWFucyB0aGF0IG9uIHBvd2VycGMgdG9kYXkgaWYgeW91CnR1cm4gb2Zm
IENPTkZJR19QUENfV0FUQ0hET0cgdGhhdCAnL3Byb2Mvc3lzL2tlcm5lbC9ubWlfd2F0Y2hkb2cn
IHdpbGwKc3RpbGwgdGhpbmsgdGhlIHdhdGNoZG9nIGlzIGVuYWJsZWQ/CgoKLURvdWcKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9y
dCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
