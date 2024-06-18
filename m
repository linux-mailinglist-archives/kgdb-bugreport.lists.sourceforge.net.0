Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F419090D5B2
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 16:43:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJa32-0001UD-Cd
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 14:42:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJa30-0001U6-Of
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 14:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mf9vRDQj5buX/JWcYXzCfiraRviKrpzpPs7rdFb3Wds=; b=J0tSweteujcNhZM805pyu/Spjn
 KoezbRZsbY4az01mLPxHY+KH7KDGCSkJ0jE/uQYywqKVpNiiF0XBYUxi7Ygdn4YOmjTyvyMa3ZfYB
 EfbUHF/eTSGw9v301EAwFSOp2IgVKb+7Yt7cHWcFIEXK8Lj+R5NSFcCCVKnv4vAA3Ljk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mf9vRDQj5buX/JWcYXzCfiraRviKrpzpPs7rdFb3Wds=; b=fZS5ODs1C7kf1W4VlpCiQxGvII
 2GHc9QXoK/Jej5NwR5pC8Sjck0lfHLXwG/AFVKHu2LXoQr4KaJK8vUWyBHGcLh3S8rpw2ZT7sQ9zw
 lfYRGtl5PU1g8B1oUYixtj7N6jrgkhyR6FukwQ19gdJ33mQ01BMYxD4y6/KyJZO/eeRI=;
Received: from mail-qt1-f176.google.com ([209.85.160.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJa30-0005f5-5x for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 14:42:58 +0000
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4405743ac19so46239781cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Jun 2024 07:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718721765; x=1719326565;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mf9vRDQj5buX/JWcYXzCfiraRviKrpzpPs7rdFb3Wds=;
 b=lXwzO1bbWMkjb7nxI895+n77+oRAPCUHiOXR5f+NYEgTC4MyxM3bBnNNnqSgPE/mvP
 KZUEG0iYuKSPsmfaheL1S7scPFvywnO5jbANLjoxKsd2hmiaI43TlH1IvdUVy798jcWy
 xQhKzAcML9twPey7xKXDDr9RQkUtCz8ayhZWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718721765; x=1719326565;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mf9vRDQj5buX/JWcYXzCfiraRviKrpzpPs7rdFb3Wds=;
 b=iBP5AP1mkf2cQf0Fh4G/IsHPmF0HfHhKSdkuz6h+NNNPhzUp9CRQNLfOx2IVud976u
 FNB8QmIEGinaoGxCvgF4R1QmpTNtgfxWujK3LlXFbQIG3xm+9Kre8P51+InLpcYdlPuO
 vXDkU6PMQK43S4EWZEGxlJbPCtRJEG2I7q6QXDqyI4toSJ73BPoXiCcyRb2AmVcWA8Zr
 PzyWCQeQ5HLvo5u+U5bBf7hAvvp+xOrx1GSjFYp0yot0Mo/D7bmGsEGU2s6QqNSZ0myL
 cPxTExzkZJrL0yE+DXu+/cYwf4vtAbXPPaLgzD0ATALJUAvse+vD7iRtM5KlmfsAqFeb
 IRFw==
X-Gm-Message-State: AOJu0YyoxWfRxfGiExH3t4eLzO6lp9yzS4hoZ8p3XY2Ej7PfLn3u6XCm
 1M2k6T4PBEVoL9Z8OBVETaxQ4saxitguoiH1sA78HVJ93dwUyA3hYXtKHYxMSEqFGuUbCs2gdmw
 =
X-Google-Smtp-Source: AGHT+IGqt/dzKAvgZX/uJmtO33LhK3twU6+4jN3cceEJmvYqwARRd/44RGZuoMwWAXtIikZdtDEu8Q==
X-Received: by 2002:a05:622a:d6:b0:440:d86:15fb with SMTP id
 d75a77b69052e-4449bcaf9fdmr50925541cf.26.1718721764747; 
 Tue, 18 Jun 2024 07:42:44 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4420c5e8e4bsm55500991cf.39.2024.06.18.07.42.43
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 07:42:44 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-443586c2091so474041cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Jun 2024 07:42:43 -0700 (PDT)
X-Received: by 2002:a05:622a:15cd:b0:43e:295:f160 with SMTP id
 d75a77b69052e-4449c71abfdmr3212491cf.24.1718721763326; Tue, 18 Jun 2024
 07:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240618003546.4144638-1-dianders@chromium.org>
 <20240617173426.6.Ia1d546061f9430a90df0e7521097040e0e939c58@changeid>
 <20240618113754.GD11330@aspen.lan>
In-Reply-To: <20240618113754.GD11330@aspen.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Jun 2024 07:42:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X6kzg4ySwWtTQkatNmSJAFpWYZqJuc_p7e+BjXz0zNhg@mail.gmail.com>
Message-ID: <CAD=FV=X6kzg4ySwWtTQkatNmSJAFpWYZqJuc_p7e+BjXz0zNhg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Tue, Jun 18, 2024 at 4:38 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > On Mon, Jun 17, 2024 at 05:34:40PM -0700, Douglas Anderson wrote:
    > > The "mdW" and "mdWcN" generally lets the [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.160.176 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [209.85.160.176 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.160.176 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.160.176 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJa30-0005f5-5x
Subject: Re: [Kgdb-bugreport] [PATCH 06/13] kdb: Remove "mdW" and "mdWcN"
 handling of "W" == 0
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

SGksCgpPbiBUdWUsIEp1biAxOCwgMjAyNCBhdCA0OjM44oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAxNywgMjAy
NCBhdCAwNTozNDo0MFBNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4gVGhlICJt
ZFciIGFuZCAibWRXY04iIGdlbmVyYWxseSBsZXRzIHRoZSB1c2VyIGNvbnRyb2wgbW9yZSBjYXJl
ZnVsbHkKPiA+IHdoYXQgd29yZCBzaXplIHdlIGRpc3BsYXkgbWVtb3J5IGluIGFuZCBleGFjdGx5
IGhvdyBtYW55IHdvcmRzIHNob3VsZAo+ID4gYmUgZGlzcGxheWVkLiBTcGVjaWZpY2FsbHksICJt
ZDQiIHNheXMgdG8gZGlzcGxheSBtZW1vcnkgdy8gNAo+ID4gYnl0ZXMtcGVyIHdvcmQgYW5kICJt
ZDRjNiIgc2F5cyB0byBkaXNwbGF5IDYgd29yZHMgb2YgbWVtb3J5IHcvCj4gPiA0LWJ5dGVzLXBl
ciB3b3JkLgo+ID4KPiA+IFRoZSBrZGIgIm1kIiBpbXBsZW1lbnRhdGlvbiBoYXMgYSBzcGVjaWFs
IHJ1bGUgZm9yIHdoZW4gIlciIGlzIDAuIEluCj4gPiB0aGlzIGNhc2U6Cj4gPiAqIElmIHlvdSBy
dW4gd2l0aCAiVyIgPT0gMCBhbmQgeW91J3ZlIG5ldmVyIHJ1biBhIGtkYiAibWQiIGNvbW1hbmQK
PiA+ICAgdGhpcyByZWJvb3QgdGhlbiBpdCB3aWxsIHBpY2sgNCBieXRlcy1wZXItd29yZCwgaWdu
b3JpbmcgdGhlIG5vcm1hbAo+ID4gICBkZWZhdWx0IGZyb20gdGhlIGVudmlyb25tZW50Lgo+ID4g
KiBJZiB5b3UgcnVuIHdpdGggIlciID09IDAgYW5kIHlvdSd2ZSBydW4gYSBrZGIgIm1kIiBjb21t
YW5kIHRoaXMKPiA+ICAgcmVib290IHRoZW4gaXQgd2lsbCBwaWNrIHVwIHRoZSBieXRlcyBwZXIg
d29yZCBvZiB0aGUgbGFzdCBjb21tYW5kLgo+ID4KPiA+IEFzIGFuIGV4YW1wbGU6Cj4gPiAgIFsx
XWtkYj4gbWQyIDB4ZmZmZmZmODBjOGUyYjI4MCAxCj4gPiAgIDB4ZmZmZmZmODBjOGUyYjI4MCAw
MjAwIDAwMDAgMDAwMCAwMDAwIGUwMDAgODIzNSAwMDAwIDAwMDAgICAuLi4KPiA+ICAgWzFda2Ri
PiBtZDAgMHhmZmZmZmY4MGM4ZTJiMjgwIDEKPiA+ICAgMHhmZmZmZmY4MGM4ZTJiMjgwIDAyMDAg
MDAwMCAwMDAwIDAwMDAgZTAwMCA4MjM1IDAwMDAgMDAwMCAgIC4uLgo+ID4gICBbMV1rZGI+IG1k
IDB4ZmZmZmZmODBjOGUyYjI4MCAxCj4gPiAgIDB4ZmZmZmZmODBjOGUyYjI4MCAwMDAwMDAwMDAw
MDAwMjAwIDAwMDAwMDAwODIzNWUwMDAgICAuLi4KPiA+ICAgWzFda2RiPiBtZDAgMHhmZmZmZmY4
MGM4ZTJiMjgwIDEKPiA+ICAgMHhmZmZmZmY4MGM4ZTJiMjgwIDAwMDAwMDAwMDAwMDAyMDAgMDAw
MDAwMDA4MjM1ZTAwMCAgIC4uLgo+ID4KPiA+IFRoaXMgZG9lc24ndCBzZWVtIGxpa2UgcGFydGlj
dWxhcmx5IHVzZWZ1bCBiZWhhdmlvciBhbmQgYWRkcyBhIGJ1bmNoCj4gPiBvZiBjb21wbGV4aXR5
IHRvIHRoZSBhcmcgcGFyc2luZy4gUmVtb3ZlIGl0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERv
dWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPiA+IC0tLQo+ID4KPiA+ICBr
ZXJuZWwvZGVidWcva2RiL2tkYl9tYWluLmMgfCA1IC0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2tlcm5lbC9kZWJ1Zy9rZGIva2Ri
X21haW4uYyBiL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX21haW4uYwo+ID4gaW5kZXggYzAxM2IwMTRh
N2QzLi43MDBiNGUzNTU1NDUgMTAwNjQ0Cj4gPiAtLS0gYS9rZXJuZWwvZGVidWcva2RiL2tkYl9t
YWluLmMKPiA+ICsrKyBiL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX21haW4uYwo+ID4gQEAgLTE2MTEs
MTEgKzE2MTEsNiBAQCBzdGF0aWMgaW50IGtkYl9tZChpbnQgYXJnYywgY29uc3QgY2hhciAqKmFy
Z3YpCj4gPgo+ID4gICAgICAgaWYgKGlzZGlnaXQoYXJndlswXVsyXSkpIHsKPiA+ICAgICAgICAg
ICAgICAgYnl0ZXNwZXJ3b3JkID0gKGludCkoYXJndlswXVsyXSAtICcwJyk7Cj4gPiAtICAgICAg
ICAgICAgIGlmIChieXRlc3BlcndvcmQgPT0gMCkgewo+ID4gLSAgICAgICAgICAgICAgICAgICAg
IGJ5dGVzcGVyd29yZCA9IGxhc3RfYnl0ZXNwZXJ3b3JkOwo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgIGlmIChieXRlc3BlcndvcmQgPT0gMCkKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJ5dGVzcGVyd29yZCA9IDQ7Cj4gPiAtICAgICAgICAgICAgIH0KPiA+ICAgICAgICAgICAg
ICAgbGFzdF9ieXRlc3BlcndvcmQgPSBieXRlc3BlcndvcmQ7Cj4gPiAgICAgICAgICAgICAgIHJl
cGVhdCA9IG1kY291bnQgKiAxNiAvIGJ5dGVzcGVyd29yZDsKPgo+IElzbid0IHRoaXMgbm93IGEg
ZGl2aWRlLWJ5LXplcm8/CgpEYW5nLCB5b3UncmUgcmlnaHQuIEl0IGdvZXMgYXdheSBpbiBhIGxh
dGVyIHBhdGNoLCB0aG91Z2gsIHNpbmNlIHdlCnN0b3AgcmUtY2FsY3VsYXRpbmcgZXZlcnl0aGlu
ZyB1bnRpbCB0aGUgZW5kIHdoZW4gdGhpbmdzIGFyZQp2YWxpZGF0ZWQuIEknbGwgcGxhbiB0byBy
ZW9yZGVyIHRoaXMgcGF0Y2ggdG8gYmUgYWZ0ZXIgdGhlIHBhdGNoCigia2RiOiBJbiBrZGJfbWQo
KSBtYWtlIGByZXBlYXRgIGFuZCBgbWRjb3VudGAgY2FsY3VsYXRpb25zIG1vcmUKb2J2aW91cyIp
LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGIt
YnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdy
ZXBvcnQK
