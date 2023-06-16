Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 393E7733673
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 16 Jun 2023 18:48:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qACcT-0004Hb-Dk
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 16 Jun 2023 16:48:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qACcO-0004HU-Hw
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 16 Jun 2023 16:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e16upKjJABhKcoxJWL82G3CWyoX8UGnrl2PWs2fRuIo=; b=YOOMbOeJ/qzbLs7WdkuCaCNdxA
 6hdNNzYK28XUrK+62IxeOACaw3zKYQgRGliPwX4flkQiudxn97a8RVA5mEK5x+wmxTE2GZ/Bf5T4a
 2x2wWraxAqkKPzKcakdz5mc2LmPwKQlEASpWkeAv+rdpYdB/UhusDloeiDdOyk/2/0jM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e16upKjJABhKcoxJWL82G3CWyoX8UGnrl2PWs2fRuIo=; b=VlK4OjDc/lcRqErJY1nddnX79S
 5t07aQT5ZD6+Fampx45OyEjNmuABscnBbhsSBwiimyFg9iQ7ZinHDeYJTboaUeiqrDY1GWpulV1sV
 EolkeBYEVmdPM36WaHddLAIwdbHd/A4dVILrHYluZ8TqFMJRlHqLkcFLI9vQC5+oMZJY=;
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qACcK-000103-0s for kgdb-bugreport@lists.sourceforge.net;
 Fri, 16 Jun 2023 16:48:11 +0000
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-51a3f911135so898369a12.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 16 Jun 2023 09:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686934080; x=1689526080;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e16upKjJABhKcoxJWL82G3CWyoX8UGnrl2PWs2fRuIo=;
 b=c3D6kky0yVlAnYbAD4t4CnCD+HrwBGJNQ7Dvmzl8dZlhDc+A7BFbwvNn+iaJcnf8eZ
 HOha8wWcTL10zrSb/jENBmBEDqfupvf9Dde43PF5VWKdQW5eni89Fl/wLMB2GkcZb7tz
 BuTTMv2HWRFvNRo0pTaIO/2occOvzreBOJO5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686934080; x=1689526080;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e16upKjJABhKcoxJWL82G3CWyoX8UGnrl2PWs2fRuIo=;
 b=E7AHrLsQAui0KXDnLjKEslQiMtohgyTb4wONmEN9XXXoacz13Ttvk5aH8zXKwGCkun
 SEMdX0rcS9cOXCQBnl3YKcxSCCJQ2n8RxUS/RwaMulbC47cIDeFN+jBEHts/sRaeZVQS
 JmbU/uUBTYxPhukXUMdnm6aOwl6cgRvSJ6I9DSqn8FW5O8VZ/ug3ic6iRnc99bzzsB2C
 ZdO9iaITxHjgCMOWJ1mMUBBNu84ekIFyH+0/NiE3OC8GUOZFdXsRFTCaSJak+urE2cel
 LZlqMpWiA375IBwPP6MUkBBdII7QcKy/rgUch7m2h13YK2WaULtklI1xIJBRnXCBWtBf
 AUrQ==
X-Gm-Message-State: AC+VfDyeBhSOMN0No8NZ+0i/RzuiJoyXwFXNMm3W6vGlLL50FYpC8CNz
 quGe/xl2MR1guMf7WAt3HLE3iWtdy5ZP43yu8fda8E6l
X-Google-Smtp-Source: ACHHUZ41m+tq2xBb7mI16k2AaoCbhqSbqX4jE2Y010IiV8g/LYXoIuoFTrYOlXvkF5vmDQBoQaFR1A==
X-Received: by 2002:a05:6402:690:b0:514:9df0:e3ec with SMTP id
 f16-20020a056402069000b005149df0e3ecmr1856878edy.0.1686934080359; 
 Fri, 16 Jun 2023 09:48:00 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 c7-20020a056402120700b00514b99afa57sm10116129edw.44.2023.06.16.09.47.59
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 09:47:59 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-3f7f7dfc037so3205e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 16 Jun 2023 09:47:59 -0700 (PDT)
X-Received: by 2002:a05:600c:444e:b0:3f4:2736:b5eb with SMTP id
 v14-20020a05600c444e00b003f42736b5ebmr415495wmn.1.1686934079227; Fri, 16 Jun
 2023 09:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230616150618.6073-1-pmladek@suse.com>
 <20230616150618.6073-3-pmladek@suse.com>
In-Reply-To: <20230616150618.6073-3-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 16 Jun 2023 09:47:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VPhpZyJO=U3NGy1RZbmAQS_xEoDs-K2HawJYb=UHaUww@mail.gmail.com>
Message-ID: <CAD=FV=VPhpZyJO=U3NGy1RZbmAQS_xEoDs-K2HawJYb=UHaUww@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Fri, Jun 16, 2023 at 8:07 AM Petr Mladek <pmladek@suse.com>
    wrote: > > There are four possible variants of hardlockup detectors: > >
   + buddy: available when SMP is set. > > + perf: available when [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.42 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.42 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qACcK-000103-0s
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/6] watchdog/hardlockup: Make the
 config checks more straightforward
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBGcmksIEp1biAxNiwgMjAyMyBhdCA4OjA34oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFk
ZWtAc3VzZS5jb20+IHdyb3RlOgo+Cj4gVGhlcmUgYXJlIGZvdXIgcG9zc2libGUgdmFyaWFudHMg
b2YgaGFyZGxvY2t1cCBkZXRlY3RvcnM6Cj4KPiAgICsgYnVkZHk6IGF2YWlsYWJsZSB3aGVuIFNN
UCBpcyBzZXQuCj4KPiAgICsgcGVyZjogYXZhaWxhYmxlIHdoZW4gSEFWRV9IQVJETE9DS1VQX0RF
VEVDVE9SX1BFUkYgaXMgc2V0Lgo+Cj4gICArIGFyY2gtc3BlY2lmaWM6IGF2YWlsYWJsZSB3aGVu
IEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9BUkNIIGlzIHNldC4KPgo+ICAgKyBzcGFyYzY0IHNw
ZWNpYWwgdmFyaWFudDogYXZhaWxhYmxlIHdoZW4gSEFWRV9OTUlfV0FUQ0hET0cgaXMgc2V0Cj4g
ICAgICAgICBhbmQgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0ggaXMgbm90IHNldC4KPgo+
IFRoZSBjaGVjayBmb3IgdGhlIHNwYXJjNjQgdmFyaWFudCBpcyBtb3JlIGNvbXBsaWNhdGVkIGJl
Y2F1c2UKPiBIQVZFX05NSV9XQVRDSERPRyBpcyB1c2VkIHRvICNpZmRlZiBjb2RlIHVzZWQgYnkg
Ym90aCBhcmNoLXNwZWNpZmljCj4gYW5kIHNwYXJjNjQgc3BlY2lmaWMgdmFyaWFudC4gVGhlcmVm
b3JlIGl0IGlzIGF1dG9tYXRpY2FsbHkKPiBzZWxlY3RlZCB3aXRoIEhBVkVfSEFSRExPQ0tVUF9E
RVRFQ1RPUl9BUkNILgo+Cj4gVGhpcyBjb21wbGV4aXR5IGlzIHBhcnRseSBoaWRkZW4gaW4gSEFW
RV9IQVJETE9DS1VQX0RFVEVDVE9SX05PTl9BUkNILgo+IEl0IHJlZHVjZXMgdGhlIHNpemUgb2Yg
c29tZSBjaGVja3MgYnV0IGl0IG1ha2VzIHRoZW0gaGFyZGVyIHRvIGZvbGxvdy4KPgo+IEZpbmFs
bHksIHRoZSBvdGhlciB0ZW1wb3JhcnkgdmFyaWFibGUgSEFSRExPQ0tVUF9ERVRFQ1RPUl9OT05f
QVJDSAo+IGlzIHVzZWQgdG8gcmUtY29tcHV0ZSBIQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYvQlVE
RFkgd2hlbiB0aGUgZ2xvYmFsCj4gSEFSRExPQ0tVUF9ERVRFQ1RPUiBzd2l0Y2ggaXMgZW5hYmxl
ZC9kaXNhYmxlZC4KPgo+IE1ha2UgdGhlIGxvZ2ljIG1vcmUgc3RyYWlnaHRmb3J3YXJkIGJ5IHRo
ZSBmb2xsb3dpbmcgY2hhbmdlczoKPgo+ICAgKyBCZXR0ZXIgZXhwbGFpbiB0aGUgcm9sZSBvZiBI
QVZFX0hBUkRMT0NLVVBfREVURUNUT1JfQVJDSCBhbmQKPiAgICAgSEFWRV9OTUlfV0FUQ0hET0cg
aW4gY29tbWVudHMuCj4KPiAgICsgQWRkIEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9CVUREWSBz
byB0aGF0IHRoZXJlIGlzIHNlcGFyYXRlCj4gICAgIEhBVkVfKiBmb3IgYWxsIGZvdXIgaGFyZGxv
Y2t1cCBkZXRlY3RvciB2YXJpYW50cy4KPgo+ICAgICBVc2UgaXQgaW4gdGhlIG90aGVyIGNvbmRp
dGlvbnMgaW5zdGVhZCBvZiBTTVAuIEl0IG1ha2VzIGl0Cj4gICAgIGNsZWFyIHRoYXQgaXQgaXMg
YWJvdXQgdGhlIGJ1ZGR5IGRldGVjdG9yLgo+Cj4gICArIE9wZW4gY29kZSBIQVZFX0hBUkRMT0NL
VVBfREVURUNUT1JfTk9OX0FSQ0ggaW4gSEFSRExPQ0tVUF9ERVRFQ1RPUgo+ICAgICBhbmQgSEFS
RExPQ0tVUF9ERVRFQ1RPUl9QUkVGRVJfQlVERFkuIEl0IGhlbHBzIHRvIHVuZGVyc3RhbmQKPiAg
ICAgdGhlIGNvbmRpdGlvbnMgYmV0d2VlbiB0aGUgZm91ciBoYXJkbG9ja3VwIGRldGVjdG9yIHZh
cmlhbnRzLgo+Cj4gICArIERlZmluZSB0aGUgZXhhY3QgY29uZGl0aW9ucyB3aGVuIEhBUkRMT0NL
VVBfREVURUNUT1JfUEVSRi9CVUREWQo+ICAgICBjYW4gYmUgZW5hYmxlZC4gSXQgZXhwbGFpbnMg
dGhlIGRlcGVuZGVuY3kgb24gdGhlIG90aGVyCj4gICAgIGhhcmRsb2NrdXAgZGV0ZWN0b3IgdmFy
aWFudHMuCj4KPiAgICAgQWxzbyBpdCBhbGxvd3MgdG8gcmVtb3ZlIEhBUkRMT0NLVVBfREVURUNU
T1JfTk9OX0FSQ0ggYnkgdXNpbmcgImltcGx5Ii4KPiAgICAgSXQgdHJpZ2dlcnMgcmUtZXZhbHVh
dGluZyBIQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYvQlVERFkgd2hlbgo+ICAgICB0aGUgZ2xvYmFs
IEhBUkRMT0NLVVBfREVURUNUT1Igc3dpdGNoIGlzIGNoYW5nZWQuCj4KPiAgICsgQWRkIGRlcGVu
ZGVuY3kgb24gSEFSRExPQ0tVUF9ERVRFQ1RPUiBzbyB0aGF0IHRoZSBhZmZlY3RlZCB2YXJpYWJs
ZXMKPiAgICAgZGlzYXBwZWFyIHdoZW4gdGhlIGhhcmRsb2NrdXAgZGV0ZWN0b3JzIGFyZSBkaXNh
YmxlZC4KPgo+ICAgICBBbm90aGVyIG5pY2Ugc2lkZSBlZmZlY3QgaXMgdGhhdCBIQVJETE9DS1VQ
X0RFVEVDVE9SX1BSRUZFUl9CVUREWQo+ICAgICB2YWx1ZSBpcyBub3QgcHJlc2VydmVkIHdoZW4g
dGhlIGdsb2JhbCBzd2l0Y2ggaXMgZGlzYWJsZWQuCj4gICAgIFRoZSB1c2VyIGhhcyB0byBtYWtl
IHRoZSBkZWNpc2lvbiBhZ2FpbiB3aGVuIGl0IGdldHMgcmUtZW5hYmxlZC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFBldHIgTWxhZGVrIDxwbWxhZGVrQHN1c2UuY29tPgo+IC0tLQo+ICBhcmNoL0tjb25m
aWcgICAgICB8IDIzICsrKysrKysrKysrKystLS0tLQo+ICBsaWIvS2NvbmZpZy5kZWJ1ZyB8IDYy
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDIgZmls
ZXMgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCgpXaGlsZSBJJ2Qg
c3RpbGwgcGFpbnQgdGhlIGJpa2VzaGVkIGEgZGlmZmVyZW50IGNvbG9yIGFuZCBvcmdhbml6ZSB0
aGUKZGVwZW5kZW5jaWVzIGEgbGl0dGxlIGRpZmZlcmVudGx5LCBhcyBkaXNjdXNzZWQgaW4geW91
ciB2MSBwb3N0LCB0aGlzCmlzIHN0aWxsIE9LIHcvIG1lLgoKUmV2aWV3ZWQtYnk6IERvdWdsYXMg
QW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dk
Yi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
