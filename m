Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F259E486D
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  5 Dec 2024 00:08:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tIyTW-00047Z-Bs
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 04 Dec 2024 23:08:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1tIyTL-000471-Gc
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 04 Dec 2024 23:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CGqvSPZ3QIpZsykiZguhFk0cjVECVeKJ3q4DQqsIrHY=; b=KMTWaMcR1dPQ+QyfB6ROWu9Fky
 qeJeEpXBCgrViXofnLv+55a9v5GDzaqt7iNDwuD1FGK33xgYfAGghuqBhQn0m1lETI55eoc/p9rcd
 RjZmo14R4cjgvN4kj/gVkJQ8YylL7wxDbwXx+NpLXHMS+tj3zOGlATotzapPTavDYxiw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CGqvSPZ3QIpZsykiZguhFk0cjVECVeKJ3q4DQqsIrHY=; b=ZJq+UaNuPPUUSV+ruyIn/hN3NS
 mdrJNNQ+Qtb3Xejv/xZ85qvr33psAOQkxVc0bMeogdTxUfv7x3W7aOogc/wi07/iFKoTz89BvYbZm
 6IFz1dWzKfTGIDN0G2nVPZtLPUjNaZx3sLZdvhfBw4KVv1J1xC7rWb+z7F3qvjOZMMN0=;
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tIyTJ-0004P0-V8 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 04 Dec 2024 23:07:54 +0000
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53dd57589c8so1573037e87.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 04 Dec 2024 15:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733353661; x=1733958461;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CGqvSPZ3QIpZsykiZguhFk0cjVECVeKJ3q4DQqsIrHY=;
 b=TmlNet3ZRO6w3GRXcCC3Biv1YBAIpPzT4T80JhHqnzICBwtBey1uaQSSutjTdiITFY
 QPomB3DEh4NLeVr5SV9+ilfFDqQGvf8nSocKW2Oe2I8eBrWGrgZZPVdjJ717QD60Aow3
 pGFeIEPNzo/Lvr2IGjlJv6mL8H4yNeN5S8lrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733353661; x=1733958461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CGqvSPZ3QIpZsykiZguhFk0cjVECVeKJ3q4DQqsIrHY=;
 b=fmIRb8P6SvEb6FlxZnWJMeAoCNrGffd1WY5hTX4ImPAiulUzCjaAAqCSLF4Sn0oVWC
 mh4zZCEZwnnCBgZPxTLKy8NkwNsVj6u54qny5VQmA5qqZH8ioHkMK/m5oOJkKF05Y4gD
 t6FIR4lHH8/oUW3/QJT5TNPL/Jh4I20KUSL8nFF/XlccaNSnTsWGUW94unqNPOXZktOe
 8pwS03bv7/wZMNc1MAEANdTn4BYBFirHQcnQNpNvJnz0QhuhnVAVJ0o1VSL+LlbQ4857
 H7coAe+f0Q7dCSOV6NDfqFZFNalGo/Gos1xEgdYRAtTOPycDqSyqjP8IVKcmBQTk67Pg
 /pJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgEZo/BKovXw+G5V/qNMchIoPmxl9YWdEcTmUfBNevlUdnGtsoRST9LOkRObNuWGqwMLTVFAKoAvAeYMn6rQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwjJUQGzuN+ox4ZyFu/YkBsh1bMzZdQy6zTpqNofRY00Ue+8f/X
 HW7iev6sMM8LiYTSogSMQj4FMi3lSXPVkIAg9kZHnxw8BDhk098gGmCZdoK59cawRCa5DzjVY3D
 W76iI
X-Gm-Gg: ASbGncsWvQCFmxGdfVfblkQN+IOUdABaGVZaArT1u1RjkoWv/nFzAxAfo4meD9i0NpU
 pN9rffeFQEHE4xBrNI/QzWo8OgSmbTW1DOs9e2GPkD9OeiQL5f6lunyxzynt75nO5EjvBGb3Dg5
 VVkzcl06oKqGZO7PUD8hv/SYHlVcvv28Oarc8FQ1rhLeEzU9U3M4gjtM1pc7pTUz92qi9sCwIm0
 h8tyy8Nit5oiMbHTWU6fTDriUD3HXz323OXLC/BON+GJ1bkJzvHxB4RNdUi+ZFRxgVHZ9JcE9wA
 Gvrj412kLml0Dw==
X-Google-Smtp-Source: AGHT+IGilzS+04U/11o1hN7D6HRTy6rH45PHBEiyHB/1xsWFlFo7GwCN66tdmzdCm0sLnj4T5ryJiQ==
X-Received: by 2002:ac2:5e6f:0:b0:53e:21c1:b88d with SMTP id
 2adb3069b0e04-53e21c1b9a8mr180295e87.6.1733353660722; 
 Wed, 04 Dec 2024 15:07:40 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e22947be2sm32360e87.12.2024.12.04.15.07.39
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 15:07:39 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53dd668c5easo362711e87.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 04 Dec 2024 15:07:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUFhvGoPG7Uy/P9avSKYqc+ZOBuk+KVo7sjfp8fFlU4ZWRw1redlQqzCCgzryhu2kkKtVA47QNLTk52yw+tUQ==@lists.sourceforge.net
X-Received: by 2002:a05:6512:2392:b0:53d:f73c:d630 with SMTP id
 2adb3069b0e04-53e21702ca6mr365280e87.14.1733353659083; Wed, 04 Dec 2024
 15:07:39 -0800 (PST)
MIME-Version: 1.0
References: <20241204221720.66146-1-rdunlap@infradead.org>
In-Reply-To: <20241204221720.66146-1-rdunlap@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Dec 2024 15:07:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WhQFxUNr6vyMVBn9CmZPnnntDP2nH=Tp1Rm=xH+YsE2w@mail.gmail.com>
Message-ID: <CAD=FV=WhQFxUNr6vyMVBn9CmZPnnntDP2nH=Tp1Rm=xH+YsE2w@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Dec 4, 2024 at 2:17 PM Randy Dunlap <rdunlap@infradead.org>
    wrote: > > Move gdb and kgdb debugging documentation to the dedicated > debugging
    directory (Documentation/process/debugging/). > [...] 
 
 Content analysis details:   (-3.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.52 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.167.52 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.167.52 listed in sa-accredit.habeas.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.52 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tIyTJ-0004P0-V8
Subject: Re: [Kgdb-bugreport] [PATCH] Documentation: move dev-tools
 debugging files to process/debugging/
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
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, kgdb-bugreport@lists.sourceforge.net,
 linux-doc@vger.kernel.org, Daniel Thompson <danielt@kernel.org>,
 workflows@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIERlYyA0LCAyMDI0IGF0IDI6MTfigK9QTSBSYW5keSBEdW5sYXAgPHJkdW5s
YXBAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBNb3ZlIGdkYiBhbmQga2dkYiBkZWJ1Z2dpbmcg
ZG9jdW1lbnRhdGlvbiB0byB0aGUgZGVkaWNhdGVkCj4gZGVidWdnaW5nIGRpcmVjdG9yeSAoRG9j
dW1lbnRhdGlvbi9wcm9jZXNzL2RlYnVnZ2luZy8pLgo+IEFkanVzdCB0aGUgaW5kZXgucnN0IGZp
bGVzIHRvIGZvbGxvdyB0aGUgZmlsZSBtb3ZlbWVudC4KPiBVcGRhdGUgbG9jYXRpb24gb2Yga2dk
Yi5yc3QgaW4gTUFJTlRBSU5FUlMgZmlsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxh
cCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+IENjOiBTZWJhc3RpYW4gRnJpY2tlIDxzZWJhc3Rp
YW4uZnJpY2tlQGNvbGxhYm9yYS5jb20+Cj4gQ2M6IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3
bi5uZXQ+Cj4gQ2M6IHdvcmtmbG93c0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzogSmFzb24gV2Vzc2Vs
IDxqYXNvbi53ZXNzZWxAd2luZHJpdmVyLmNvbT4KPiBDYzogRGFuaWVsIFRob21wc29uIDxkYW5p
ZWx0QGtlcm5lbC5vcmc+Cj4gQ2M6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVt
Lm9yZz4KPiBDYzogbGludXgtZGVidWdnZXJzQHZnZXIua2VybmVsLm9yZwo+IENjOiBrZ2RiLWJ1
Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXYt
dG9vbHMvaW5kZXgucnN0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAy
IC0tCj4gIERvY3VtZW50YXRpb24ve2Rldi10b29scyA9PiBwcm9jZXNzL2RlYnVnZ2luZ30vZ2Ri
LWtlcm5lbC1kZWJ1Z2dpbmcucnN0IHwgMAoKQWZ0ZXIgYXBwbHlpbmcgeW91ciBwYXRjaCBhbmQg
ZG9pbmcgYGdpdCBncmVwCmdkYi1rZXJuZWwtZGVidWdnaW5nLnJzdGAsIEkgc3RpbGwgc2VlIHNl
dmVyYWwgcmVmZXJlbmNlcyB0byB0aGUgb2xkCmxvY2F0aW9uLiBUaG9zZSBzaG91bGQgYmUgdXBk
YXRlZCBhcyBwYXJ0IG9mIHRoaXMgcGF0Y2gsIHJpZ2h0PwoKCgo+ICBEb2N1bWVudGF0aW9uL3By
b2Nlc3MvZGVidWdnaW5nL2luZGV4LnJzdCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDIgKysKPiAgRG9jdW1lbnRhdGlvbi97ZGV2LXRvb2xzID0+IHByb2Nlc3MvZGVidWdnaW5nfS9r
Z2RiLnJzdCAgICAgICAgICAgICAgICAgfCAwCgpTaW1pbGFybHkgYGdpdCBncmVwIGtnZGIucnN0
YCBzdGlsbCBoYXMgc2V2ZXJhbCByZWZlcmVuY2VzIHRvIHRoZSBvbGQgbG9jYXRpb24uCgo+ICBN
QUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDIgKy0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMv
aW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMvaW5kZXgucnN0Cj4gaW5kZXggM2Mw
YWMwOGIyNzA5Li5jMWU3M2U3NWY1NTEgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXYt
dG9vbHMvaW5kZXgucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMvaW5kZXgucnN0
Cj4gQEAgLTI3LDggKzI3LDYgQEAgRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMvdGVzdGluZy1vdmVy
dmlldy5yc3QKPiAgICAga21lbWxlYWsKPiAgICAga2NzYW4KPiAgICAga2ZlbmNlCj4gLSAgIGdk
Yi1rZXJuZWwtZGVidWdnaW5nCj4gLSAgIGtnZGIKPiAgICAga3NlbGZ0ZXN0Cj4gICAgIGt1bml0
L2luZGV4Cj4gICAgIGt0YXAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMv
Z2RiLWtlcm5lbC1kZWJ1Z2dpbmcucnN0IGIvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2RlYnVnZ2lu
Zy9nZGIta2VybmVsLWRlYnVnZ2luZy5yc3QKPiBzaW1pbGFyaXR5IGluZGV4IDEwMCUKPiByZW5h
bWUgZnJvbSBEb2N1bWVudGF0aW9uL2Rldi10b29scy9nZGIta2VybmVsLWRlYnVnZ2luZy5yc3QK
PiByZW5hbWUgdG8gRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2RlYnVnZ2luZy9nZGIta2VybmVsLWRl
YnVnZ2luZy5yc3QKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2RlYnVnZ2lu
Zy9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3Byb2Nlc3MvZGVidWdnaW5nL2luZGV4LnJzdAo+
IGluZGV4IGY2ZTRhMDBkZmVlMy4uYmM0YTgxNmUzZDMyIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50
YXRpb24vcHJvY2Vzcy9kZWJ1Z2dpbmcvaW5kZXgucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9w
cm9jZXNzL2RlYnVnZ2luZy9pbmRleC5yc3QKPiBAQCAtMTIsNiArMTIsOCBAQCBnZW5lcmFsIGd1
aWRlcwo+Cj4gICAgIGRyaXZlcl9kZXZlbG9wbWVudF9kZWJ1Z2dpbmdfZ3VpZGUKPiAgICAgdXNl
cnNwYWNlX2RlYnVnZ2luZ19ndWlkZQo+ICsgICBnZGIta2VybmVsLWRlYnVnZ2luZwo+ICsgICBr
Z2RiCgpTaG91bGQgdGhlIGxpc3QgYWJvdmUgYmUga2VwdCBhbHBoYWJldGljYWwuIFRoZSBsaXN0
IHlvdSByZW1vdmVkIHRoZXNlCmVudHJpZXMgZnJvbSB3YXMgX2FsbW9zdF8gYWxwaGFiZXRpY2Fs
Li4uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dk
Yi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1
Z3JlcG9ydAo=
