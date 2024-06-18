Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C8390D5AF
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 16:42:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJa2p-0000Qk-GZ
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 14:42:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJa2o-0000QU-1u
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 14:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yu4vXVj4mN6mk3P8b69LMGaDAOhCuHbfRYytMDO4e7I=; b=XHcpk2ahT8DSK/C6tTbwwowYiI
 m60VeVi03GOKZZo6aUjjr2QJgi8Rj0+n+LouEuf5q75keFjAUYqMf1hQ2v3B54Wx398CdDrm8DLbb
 vluCCpiY73OMe6Dy5jVm8Wpu0/uT+IyI5LXd6XD6rupGAA8aA1RO9iXNN10LWqCYgv9M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yu4vXVj4mN6mk3P8b69LMGaDAOhCuHbfRYytMDO4e7I=; b=KRJq46tvHi2bMtxkoVdtbeC/0p
 wz3gvKgBR2b5dOSWKR62BT6nIoYyGzdzubAIgfBDbn/+WLdy+9J3wDFDxnjFV0VmIuPyrypc+DTaM
 ZfOF608kUNDG2MgZi1aaed7dFGB0lo0lwl4ddtYmpyclWzY1coqaHeH+mUAMpf38UgTo=;
Received: from mail-qk1-f176.google.com ([209.85.222.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJa2o-0005eW-AC for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 14:42:46 +0000
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-795fb13b256so501581385a.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Jun 2024 07:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718721753; x=1719326553;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yu4vXVj4mN6mk3P8b69LMGaDAOhCuHbfRYytMDO4e7I=;
 b=fPLe4hc4hqlYC9V403TAoV9EPkZZQF5lobv4+xnkdiB9cvxwgpiBu/cUh7uHiPKQmL
 oT+AvoVZWGiw8NoxCptS0Sq9ai2/nd7fN1WHWwAzUVUb6zF84v+XVd0L/A+VirlGBuqJ
 jS4STpv1bOdJ6PiXMvBrrX6paSlkzv/H9qpAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718721753; x=1719326553;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yu4vXVj4mN6mk3P8b69LMGaDAOhCuHbfRYytMDO4e7I=;
 b=m5eYiO8+4k0PMjfQ21g3Zq7mEg0j1lsn0wzV4srPU6adwOp2hZCrr0a0c85pHcZNJp
 quQxySDuo1p/ZJE51Lfhm6IpFTQFZNypTOktERktERpy2HbfOXNuxVouEyfwpmGJ2Fbu
 vqQJhn1VPxLPhMQESjQ6PDBZA/St6rUKjUp/JE9hXebbZ1A4y+9mXabrcjYCra33M28H
 XrPmrYA+v3R+ciim0d1LS+MTdoOxaFpopduiAjrnBZ+ekFWo6VtpEpU4z2aIAq4mFtiM
 DTjT/dbyI7vmnLsGy76kG+WapGicTo+lR9oneBDLMrTBRteIJB4nkFhKxJSYYY0nvcNi
 hvYw==
X-Gm-Message-State: AOJu0YwHrppnYcCTqMjqE9XlmtUdBY1TeEESie8n7cloTruLhqzopG8B
 n6dIRFySLjA9lhXZmrKnf0t8/iMJyB4sucS+pYYxfCTgWD2mfLvpXyDHjWCS7w9aLYbfTlHldXE
 =
X-Google-Smtp-Source: AGHT+IH+JVet7Ynkl7DD95zMYqI2HJy77DFH9qDIdsSsgYk9HlKVatQ60kyZoHMivfYoVgx6Ty1JtQ==
X-Received: by 2002:a05:620a:4612:b0:795:59a2:e52b with SMTP id
 af79cd13be357-79ba76b1fc0mr424914585a.5.1718721752788; 
 Tue, 18 Jun 2024 07:42:32 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441ef3d8fafsm56644961cf.8.2024.06.18.07.42.31
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 07:42:32 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-443586c2091so473821cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Jun 2024 07:42:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1113:b0:441:53bc:4f8f with SMTP id
 d75a77b69052e-4449daab6b7mr3324501cf.27.1718721751289; Tue, 18 Jun 2024
 07:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240618003546.4144638-1-dianders@chromium.org>
 <20240617173426.2.I5621f286f5131c84ac71a212508ba1467ac443f2@changeid>
 <20240618112402.GB11330@aspen.lan>
In-Reply-To: <20240618112402.GB11330@aspen.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Jun 2024 07:42:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WjQjGgGeH5BiC7cc93OVuka+Fx+0BVHjdem2px_N=Y=g@mail.gmail.com>
Message-ID: <CAD=FV=WjQjGgGeH5BiC7cc93OVuka+Fx+0BVHjdem2px_N=Y=g@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Tue, Jun 18, 2024 at 4:24 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > On Mon, Jun 17, 2024 at 05:34:36PM -0700, Douglas Anderson wrote:
    > > The documentation for the variouis "md" [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.222.176 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.222.176 listed in sa-accredit.habeas.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.176 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJa2o-0005eW-AC
Subject: Re: [Kgdb-bugreport] [PATCH 02/13] kdb: Document the various "md"
 commands better
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
 Thorsten Blum <thorsten.blum@toblux.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUdWUsIEp1biAxOCwgMjAyNCBhdCA0OjI04oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAxNywgMjAy
NCBhdCAwNTozNDozNlBNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4gVGhlIGRv
Y3VtZW50YXRpb24gZm9yIHRoZSB2YXJpb3VpcyAibWQiIGNvbW1hbmRzIHdhcyBpbmNvbnNpc3Rl
bnQKPiA+IGFib3V0IGRvY3VtZW50aW5nIHRoZSBjb21tYW5kIGFyZ3VtZW50cy4gSXQgd2FzIGFs
c28gaGFyZCB0byBmaWd1cmUKPiA+IG91dCB3aGF0IHRoZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRo
ZSAicGh5cyIsICJyYXciLCBhbmQgInN5bWJvbGljIgo+ID4gdmVyc2lvbnMgd2FzLgo+ID4KPiA+
IFVwZGF0ZSB0aGUgaGVscCBzdHJpbmdzIHRvIG1ha2UgdGhpbmdzIG1vcmUgb2J2aW91cy4KPiA+
Cj4gPiBBcyBwYXJ0IG9mIHRoaXMsIGFkZCAiYm9ndXMiIGNvbW1hbmRzIHRvIHRoZSB0YWJsZSBm
b3IgIm1kVyIgYW5kCj4gPiAibWRXY04iIHNvIHdlIGRvbid0IGhhdmUgdG8gb2JzY3VyZWx5IHJl
ZmVyZW5jZSB0aGVtIGluIHRoZSBub3JtYWwKPiA+ICJtZCIgaGVscC4gVGhlc2UgYm9ndXMgY29t
bWFuZHMgZG9uJ3QgcmVhbGx5IGh1cnQgc2luY2Uga2RiX21kKCkKPiA+IHZhbGlkYXRlcyBhcmd2
WzBdIGVub3VnaC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFu
ZGVyc0BjaHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+Cj4gPiAga2VybmVsL2RlYnVnL2tkYi9rZGJf
bWFpbi5jIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEva2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jIGIva2VybmVsL2RlYnVnL2tk
Yi9rZGJfbWFpbi5jCj4gPiBpbmRleCBjYmViMjAzNzg1YjQuLjQ3ZTAzN2MzYzAwMiAxMDA2NDQK
PiA+IC0tLSBhL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX21haW4uYwo+ID4gKysrIGIva2VybmVsL2Rl
YnVnL2tkYi9rZGJfbWFpbi5jCj4gPiBAQCAtMTUxNiwxNCArMTUxNiw5IEBAIHN0YXRpYyBpbnQg
a2RiX21kcih1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGludCBjb3VudCkKPiA+ICB9Cj4g
Pgo+ID4gIC8qCj4gPiAtICoga2RiX21kIC0gVGhpcyBmdW5jdGlvbiBpbXBsZW1lbnRzIHRoZSAn
bWQnLCAnbWQxJywgJ21kMicsICdtZDQnLAo+ID4gLSAqICAgJ21kOCcgJ21kcicgYW5kICdtZHMn
IGNvbW1hbmRzLgo+ID4gKyAqIGtkYl9tZCAtIFRoaXMgZnVuY3Rpb24gaW1wbGVtZW50cyB0aGUg
Z3V0cyBvZiB0aGUgdmFyaW91cyAnbWQnIGNvbW1hbmRzLgo+ID4gICAqCj4gPiAtICogICBtZHxt
ZHMgIFs8YWRkciBhcmc+IFs8bGluZSBjb3VudD4gWzxyYWRpeD5dXV0KPiA+IC0gKiAgIG1kV2NO
ICAgWzxhZGRyIGFyZz4gWzxsaW5lIGNvdW50PiBbPHJhZGl4Pl1dXQo+ID4gLSAqICAgICAgICAg
ICB3aGVyZSBXID0gaXMgdGhlIHdpZHRoICgxLCAyLCA0IG9yIDgpIGFuZCBOIGlzIHRoZSBjb3Vu
dC4KPiA+IC0gKiAgICAgICAgICAgZm9yIGVnLiwgbWQxYzIwIHJlYWRzIDIwIGJ5dGVzLCAxIGF0
IGEgdGltZS4KPiA+IC0gKiAgIG1kciAgPGFkZHIgYXJnPiw8Ynl0ZSBjb3VudD4KPiA+ICsgKiBT
ZWUgdGhlIGtkYiBoZWxwIGZvciBzeW50YXguCj4gPiAgICovCj4gPiAgc3RhdGljIHZvaWQga2Ri
X21kX2xpbmUoY29uc3QgY2hhciAqZm10c3RyLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgaW50IHN5bWJvbGljLCBpbnQgbm9zZWN0LCBpbnQgYnl0ZXNwZXJ3
b3JkLAo+ID4gQEAgLTI2NzcsMjYgKzI2NzIsMzggQEAgRVhQT1JUX1NZTUJPTF9HUEwoa2RiX3Vu
cmVnaXN0ZXIpOwo+ID4gIHN0YXRpYyBrZGJ0YWJfdCBtYWludGFiW10gPSB7Cj4gPiAgICAgICB7
ICAgICAgIC5uYW1lID0gIm1kIiwKPiA+ICAgICAgICAgICAgICAgLmZ1bmMgPSBrZGJfbWQsCj4g
PiAtICAgICAgICAgICAgIC51c2FnZSA9ICI8dmFkZHI+IiwKPiA+IC0gICAgICAgICAgICAgLmhl
bHAgPSAiRGlzcGxheSBNZW1vcnkgQ29udGVudHMsIGFsc28gbWRXY04sIGUuZy4gbWQ4YzEiLAo+
ID4gKyAgICAgICAgICAgICAudXNhZ2UgPSAiPHZhZGRyPiBbPGxpbmVzPiBbPHJhZGl4Pl1dIiwK
PiA+ICsgICAgICAgICAgICAgLmhlbHAgPSAiRGlzcGxheSBSQU0gdXNpbmcgQllURVNQRVJXT1JE
OyBzaG93IE1EQ09VTlQgbGluZXMiLAo+Cj4gSSdkIHByZWZlciAibWVtb3J5IiBvdmVyICJSQU0i
IGJlY2F1c2UgaXQncyB3aGF0IHRoZSBtbmVtb25pYyBpcwo+IGFiYnJldmlhdGluZy4gVGhpcyBh
cHBsaWVzIHRvIGFsbCBvZiB0aGUgYmVsb3cgYnV0IEkgd29uJ3QgYmUgYWRkaW5nIGEKPiAic2Ft
ZSBoZXJlIiBmb3IgYWxsIG9mIHRoZW0uCj4KPiBXaGVyZSB3ZSBoYXZlIHRvIGNydXNoIHNvbWV0
aGluZyB0byBmaXQgaW50byBvbmUgbGluZSB3ZSdkIHRoYW4gaGF2ZSB0bwo+IGJyZWFrIHRoZSBw
YXR0ZXJuIGFuZCBjaG9vc2UgZnJvbSB0aGluZyBsaWtlOgo+Cj4gMS4gU2hvdyBtZW1vcnkKPiAy
LiBEaXNwbGF5IFJBTQo+IDMuIERpc3BsYXkgbWVtCj4KPiBQZXJzb25hbGx5IEkgcHJlZmVyICMx
IGJ1dCBjb3VsZCBwcm9iYWJseSBjb3BlIHdpdGggIzIuCgpJJ20gbm90IGRlYWQgc2V0IG9uIFJB
TSwgYnV0IGF0IGxlYXN0IGZvciBtZSBSQU0gd2FzIG1vcmUgY2xhcmlmeWluZy4KU3BlY2lmaWNh
bGx5IHdoZW4gaXQgc2FpZCAibWVtb3J5IiBJIGFsd2F5cyBhc3N1bWVkIGl0IHdvdWxkIHRha2Ug
aW4KYW55IG1lbW9yeSBhZGRyZXNzIGFuZCB3aGVuIEkgZmlyc3QgbG9va2VkIGF0IHRoaXMgSSB0
cmllZCB0byBmaWd1cmUKb3V0IHdoeSBtZW1vcnkgYWRkcmVzc2VzIGluIHRoZSBJTyBzcGFjZSBk
aWRuJ3Qgd29yayB3aXRoIHRoZXNlCmNvbW1hbmRzLiBJIGZpZ3VyZWQgSSB3YXMgaG9sZGluZyBp
dCB3cm9uZyBvbmx5IHRvIGZpbmQgb3V0IHRoYXQgdGhlCmNvbW1hbmRzIHNwZWNpZmljYWxseSBs
aW1pdCB5b3UgdG8ganVzdCB0aGUgUkFNIHJhbmdlIG9mIG1lbW9yeQphZGRyZXNzZXMuCgpUaGF0
IGJlaW5nIHNhaWQsIEkgZG9uJ3QgZmVlbCBzdHJvbmdseSBzbyBpZiB5b3UgcmVhbGx5IGxpa2Ug
Im1lbW9yeSIKSSdsbCBjaGFuZ2UgaXQgYmFjay4KCgo+ID4gICAgICAgICAgICAgICAuZmxhZ3Mg
PSBLREJfRU5BQkxFX01FTV9SRUFEIHwgS0RCX1JFUEVBVF9OT19BUkdTLAo+ID4gICAgICAgfSwK
PiA+IC0gICAgIHsgICAgICAgLm5hbWUgPSAibWRyIiwKPiA+ICsgICAgIHsgICAgICAgLm5hbWUg
PSAibWRXIiwKPiA+ICAgICAgICAgICAgICAgLmZ1bmMgPSBrZGJfbWQsCj4gPiAtICAgICAgICAg
ICAgIC51c2FnZSA9ICI8dmFkZHI+IDxieXRlcz4iLAo+ID4gLSAgICAgICAgICAgICAuaGVscCA9
ICJEaXNwbGF5IFJhdyBNZW1vcnkiLAo+ID4gKyAgICAgICAgICAgICAudXNhZ2UgPSAiPHZhZGRy
PiBbPGxpbmVzPiBbPHJhZGl4Pl1dIiwKPiA+ICsgICAgICAgICAgICAgLmhlbHAgPSAiRGlzcGxh
eSBSQU0gdXNpbmcgd29yZCBzaXplIChXKSBvZiAxLCAyLCA0LCBvciA4IiwKPgo+IFdlIG5lZWQg
YW4gImUuZy4gbWQ4IiBpbiBoZXJlIHNvbWV3aGVyZS4gT3RoZXJ3aXNlIGl0IGlzIG5vdCBhdCBh
bGwKPiBvYnZpb3VzIHRoYXQgVyBpcyBhIHdpbGRjYXJkLgo+Cj4gSSBndWVzcyB0aGF0IGFsdGVy
bmF0aXZlbHkgeW91IGNvdWxkIGFsc28gdHJ5IG5hbWluZyB0aGUgY29tbWFuZCB3aXRoCj4gaGlu
dCB0aGF0IFcgaXMgYSB3aWxkIGNhcmQgKHdoYXQgaGFwcGVucyBpZiB5b3UgcmVnaXN0ZXIgYSBj
b21tYW5kCj4gY2FsbGVkIG1kPFc+PykuCj4KPgo+ID4gKyAgICAgICAgICAgICAuZmxhZ3MgPSBL
REJfRU5BQkxFX01FTV9SRUFEIHwgS0RCX1JFUEVBVF9OT19BUkdTLAo+ID4gKyAgICAgfSwKPiA+
ICsgICAgIHsgICAgICAgLm5hbWUgPSAibWRXY04iLAo+ID4gKyAgICAgICAgICAgICAuZnVuYyA9
IGtkYl9tZCwKPiA+ICsgICAgICAgICAgICAgLnVzYWdlID0gIjx2YWRkcj4gWzxsaW5lcz4gWzxy
YWRpeD5dXSIsCj4gPiArICAgICAgICAgICAgIC5oZWxwID0gIkRpc3BsYXkgUkFNIHVzaW5nIHdv
cmQgc2l6ZSAoVyk7IHNob3cgTiB3b3JkcyIsCj4KPiBTYW1lIGhlcmUuCgpTdXJlLCBzbzoKCi5u
YW1lID0gIm1kPFc+IiwKLmhlbHAgPSAiRGlzcGxheSBSQU0gdXNpbmcgd29yZCBzaXplIDEsIDIs
IDQsIG9yIDg7IGUuZy4gbWQ4IiwKCi5uYW1lID0gIm1kPFc+YzxOPiIsCi5oZWxwID0gIkRpc3Bs
YXkgUkFNIHVzaW5nIHdvcmQgc2l6ZSBXOyBzaG93IE4gd29yZHM7IGUuZy4gbWQ0YzYiLAoKLi4u
b3IgY2hhbmdpbmcgUkFNIHRvICJtZW1vcnkiIGlmIHlvdSBkb24ndCBidXkgbXkgYXJndW1lbnQg
YWJvdmUuCgpXZSdyZSBkZWZpbml0ZWx5IGVuZGluZyB1cCBvdmVyIHRoZSA4MCBjaGFyYWN0ZXIg
bWFyayBoZXJlLCBidXQgSQphc3N1bWUgdGhhdCdzIE9LLiBXZSB3ZXJlIGV2ZW4gYmVmb3JlIG15
IGNoYW5nZS4KCkknbGwgYXNzdW1lIHRoYXQgSSBkb24ndCBuZWVkIHRoZSAiZS5nLiIgZm9yIGFs
bCB0aGUgZm9sbG93dXAgKG1kcCwKbWRpKSB2YXJpYW50cyBpbnRyb2R1Y2VkIGluIGxhdGVyIHBh
dGNoZXM/CgoKUmFuZG9tIHF1ZXN0aW9uOiBmb3IgdGhlIG1kV2NOIHZhcmlhbnQsIHNob3VsZCBJ
IG1ha2Ugc3BlY2lmeWluZwo8bGluZXM+IGlsbGVnYWw/IEl0J3MgcHJldHR5IHNpbGx5IHRvIGxl
dCB0aGUgdXNlciBzcGVjaWZ5IGEgd29yZApjb3VudCBhbmQgdGhlbiBpbW1lZGlhdGVseSBvdmVy
cmlkZSBpdC4gSW4gdGhhdCBjYXNlLCBkbyBJIGJ1bXAKIjxyYWRpeD4iIHRvIHRoZSAybmQgYXJn
dW1lbnQgb3IganVzdCBkb24ndCBhbGxvdyAiPHJhZGl4PiIgZm9yIG1kV2NOPwpUaGF0IHdvdWxk
IG5lZWQgdG8gYmUgZG9uZSBpbiBhIGxhdGVyIHBhdGNoLCBvYnZpb3VzbHkuLi4KCi1Eb3VnCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdy
ZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9y
dAo=
