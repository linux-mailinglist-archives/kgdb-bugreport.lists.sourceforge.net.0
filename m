Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2A3742B9E
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 29 Jun 2023 19:58:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qEvuM-0005Kn-Gz
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 29 Jun 2023 17:58:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qEvuJ-0005Kh-GS
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 29 Jun 2023 17:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8mOqBhtdl60cTKHqlJJvAt4fA4w+Uig7XN18wNz+bfw=; b=jXi11HBQlj2AS09awSJLcbP1NP
 bn9jFy0vi65dy5hx19vKi/BgSrpptqPhKEKlroXa7jTV6OWktw52NrLtC9QGa5DNz+KmGaBtPbF12
 278KszkHgQ89M2vBMT6eTnleJaXdNkyFMKfB8mLlNpaiJk3+HJl8r3Hu8FwPWX2kONwk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8mOqBhtdl60cTKHqlJJvAt4fA4w+Uig7XN18wNz+bfw=; b=jRLl61MBKCkurl8+PHxcClUWWH
 rQSFi0LEQ2Ffty93AR2sQQQMu9SoEsl25pnaufCkHUyp2NcYAolJBM++Iofs5kZigJceubY/oKDyO
 e3o+3PAvmgNj2fC+tkYm/2ztApHnBSNMEWtBpjWIl+j6MC56jQQySNuiDbtQdrBCpUdM=;
Received: from mail-ed1-f47.google.com ([209.85.208.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qEvuH-0004So-Ec for kgdb-bugreport@lists.sourceforge.net;
 Thu, 29 Jun 2023 17:58:14 +0000
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-51d5569e4d1so1058073a12.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 29 Jun 2023 10:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688061486; x=1690653486;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8mOqBhtdl60cTKHqlJJvAt4fA4w+Uig7XN18wNz+bfw=;
 b=Z4lhsdPsKnSib4AHy/JoWjTYN2lxFAlHcZVn2vCaOg0ftF72Cq/ztxr9nDthAkLwmg
 U1+u7K3m1cG7v1iOx2nna7811JRbhPcV7wJ6qwpTQex1zJa7aF4dTmiEz/3+ExFVGfJT
 pvXjVfbyaitU7XLrctccddqjun/8+CuAy1MQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688061486; x=1690653486;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8mOqBhtdl60cTKHqlJJvAt4fA4w+Uig7XN18wNz+bfw=;
 b=K7Zl05aZ0qIsb6BIq3XwcFPmvggNcqL58U99bEiEiNq27KKKDrdsjSdQCGj7xLk/y9
 hiiwfQo9eDnTOK4imPTlVKDKxB906SzV6dwiolQu5C9qxNH94PsM3GRAchrCClpKOena
 nY5+c3S8xojzs770TuaP04MztLE12tl3gcy2Y5JCfgVy6kL3vdFB3XCD7UzdOUsjwQYt
 3QnSYfT/S5GUnO2qhBkAMhsdqjIQkTDUKHHpmiUO+caPnVRViHkMY0EnUnnb7W3Y3cN3
 p/NTx/l8k9NJiHNKty9dxMZYpIz9epVqUsUbF/RncRmzf4R86JSe+XXnlDlq3Wuo/g1H
 LROg==
X-Gm-Message-State: ABy/qLYkPDOifq8N59/bawxGOc3zkPKy3YWrttqoqN786oQCqvD6Xn/0
 NGoNOODgKfqsNBqz2y03aMnSDV7vh34X+70j4jRXa17g
X-Google-Smtp-Source: APBJJlEdUIjGVx9DUA3XaOjBLXgqalALuNQ29kWqGCsjbx5cGbxY1wA1NdRPdYzm3efV6S2YWFXtiA==
X-Received: by 2002:a17:906:4dc6:b0:988:3ce8:c5bf with SMTP id
 f6-20020a1709064dc600b009883ce8c5bfmr139553ejw.33.1688060980153; 
 Thu, 29 Jun 2023 10:49:40 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 gj22-20020a170906e11600b0098e025cda3dsm6673651ejb.140.2023.06.29.10.49.39
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 10:49:39 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-51ddbf83ff9so1218a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 29 Jun 2023 10:49:39 -0700 (PDT)
X-Received: by 2002:a50:c01a:0:b0:51a:1fd1:952f with SMTP id
 r26-20020a50c01a000000b0051a1fd1952fmr147975edb.1.1688060978791; Thu, 29 Jun
 2023 10:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230628125612.1.I5cc6c3d916195f5bcfdf5b75d823f2037707f5dc@changeid>
 <20230629164809.GA2872423@aspen.lan>
In-Reply-To: <20230629164809.GA2872423@aspen.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Jun 2023 10:49:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UFEhyqtSM9H4kEj72c5UEpeREZBszULhFsDAMnyLNCoA@mail.gmail.com>
Message-ID: <CAD=FV=UFEhyqtSM9H4kEj72c5UEpeREZBszULhFsDAMnyLNCoA@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Thu, Jun 29, 2023 at 9:48 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > On Wed, Jun 28, 2023 at 12:56:17PM -0700, Douglas Anderson wrote:
    > > The main kdb command parser only handles [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.47 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qEvuH-0004So-Ec
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Handle LF in the command parser
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
Cc: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Aaron Tomlin <atomlin@atomlin.com>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUaHUsIEp1biAyOSwgMjAyMyBhdCA5OjQ44oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAyOCwgMjAy
MyBhdCAxMjo1NjoxN1BNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4gVGhlIG1h
aW4ga2RiIGNvbW1hbmQgcGFyc2VyIG9ubHkgaGFuZGxlcyBDUiAoQVNDSUkgMTMgQUtBICdccicp
IHRvZGF5LAo+ID4gYnV0IG5vdCBMRiAoQVNDSUkgMTAgQUtBICdcbicpLiBUaGF0IG1lYW5zIHRo
YXQgdGhlIGtkYiBjb21tYW5kIHBhcnNlcgo+ID4gY2FuIGhhbmRsZSB0ZXJtaW5hbHMgdGhhdCBz
ZW5kIGp1c3QgQ1Igb3IgdGhhdCBzZW5kIENSK0xGIGJ1dCBjYW4ndAo+ID4gaGFuZGxlIHRlcm1p
bmFscyB0aGF0IHNlbmQganVzdCBMRi4KPiA+Cj4gPiBUaGUgZmFjdCB0aGF0IGtkYiBkaWRuJ3Qg
aGFuZGxlIExGIGluIHRoZSBjb21tYW5kIHBhcnNlciB0cmlwcGVkIHVwIGEKPiA+IHRvb2wgSSB0
cmllZCB0byB1c2Ugd2l0aCBpdC4gU3BlY2lmaWNhbGx5LCBJIHdhcyB0cnlpbmcgdG8gc2VuZCBh
Cj4gPiBjb21tYW5kIHRvIG15IGRldmljZSB0byByZXN1bWUgaXQgZnJvbSBrZGIgdXNpbmcgYSBD
aHJvbWVPUyB0b29sIGxpa2U6Cj4gPiAgIGR1dC1jb250cm9sIGNwdV91YXJ0X2NtZDoiZyIKPiA+
IFRoYXQgdG9vbCBvbmx5IHRlcm1pbmF0ZXMgbGluZXMgd2l0aCBMRiwgbm90IENSK0xGLgo+ID4K
PiA+IEFyZ3VhYmx5IHRoZSBDaHJvbWVPUyB0b29sIHNob3VsZCBiZSBmaXhlZC4gQWZ0ZXIgYWxs
LCBvZmZpY2lhbGx5IGtkYgo+ID4gc2VlbXMgdG8gYmUgZGVzaWduZWQgc3VjaCB0aGF0IENSK0xG
IGlzIHRoZSBvZmZpY2lhbCBsaW5lIGVuZGluZwo+ID4gdHJhbnNtaXR0ZWQgb3ZlciB0aGUgd2ly
ZSBhbmQgdGhhdCBpbnRlcm5hbGx5IGEgbGluZSBlbmRpbmcgaXMganVzdAo+ID4gJ1xuJyAoTEYp
LiBTb21lIGV2aWRlbmNlOgo+ID4gKiB1YXJ0X3BvbGxfcHV0X2NoYXIoKSwgd2hpY2ggaXMgdXNl
ZCBieSBrZGIsIG5vdGljZXMgYSAnXG4nIGFuZAo+ID4gICBjb252ZXJ0cyBpdCB0byAnXHJcbicu
Cj4gPiAqIGtkYiBmdW5jdGlvbnMgc3BlY2lmaWNhbGx5IHVzZSAnXHInIHRvIGdldCBhIGNhcnJp
YWdlIHJldHVybiB3aXRob3V0Cj4gPiAgIGEgbmV3bGluZS4gWW91IGNhbiBzZWUgdGhpcyBpbiB0
aGUgcGFnZXIgd2hlcmUga2RiIHdpbGwgd3JpdGUgYSAnXHInCj4gPiAgIGFuZCB0aGVuIHdyaXRl
IG92ZXIgdGhlIHBhZ2VyIHByb21wdC4KPgo+IEknZCB2aWV3IHRoaXMgYXMgc2ltcGx5ICJ3aGF0
IHlvdSBoYXZlIHRvIGRvIGRyaXZlIGEgdGVybWluYWwgY29ycmVjdGx5Igo+IHJhdGhlciB0aGFu
IGluZGljYXRpbmcgd2hhdCB0aGUgb2ZmaWNpYWwgbmV3bGluZSBwcm90b2NvbCBmb3Iga2RiIGlz
Lgo+IFdpdGggYSBodW1hbiBhbmQgYSB0ZXJtaW5hbCBlbXVsYXRvciBJIHdvdWxkIGV4cGVjdCB0
aGUgdHlwaWNhbCBpbnB1dCB0bwo+IGJlIENSLW9ubHkgKGFuZCB0aGF0J3Mgd2hhdCBJIHNldHVw
IHRoZSB0ZXN0IHN1aXRlIHRvIHNlbmQgOy0pKS4KCkZhaXIgZW5vdWdoLiBJIGhhdmVuJ3QgZG9u
ZSBtYXNzaXZlIGFtb3VudHMgb2Ygc2VyaWFsIGNvbW11bmljYXRpb25zCmFjcm9zcyBsb3RzIG9m
IHBsYXRmb3JtcywgYnV0IEkgZG8gcmVtZW1iZXIgdGhlIGhpc3Rvcnkgb2YgbGluZQplbmRpbmdz
IGluIHRleHQgZmlsZXMgYW5kIHNvIEkgd2FudGVkIHRvIGRvY3VtZW50IG15IGZpbmRpbmdzIGEg
Yml0Lgo7LSkKCgo+ID4gSG93ZXZlciwgYWxsIHRoYXQgYmVpbmcgc2FpZCB0aGVyZSdzIG5vIHJl
YWwgaGFybSBpbiBhY2NlcHRpbmcgTEYgYXMgYQo+ID4gY29tbWFuZCB0ZXJtaW5hdG9yIGluIHRo
ZSBrZGIgcGFyc2VyIGFuZCBkb2luZyBzbyBzZWVtcyBsaWtlIGl0IHdvdWxkCj4gPiBpbXByb3Zl
IGNvbXBhdGliaWxpdHkuIEFmdGVyIHRoaXMsIEknZCBleHBlY3QgdGhhdCB0aGluZ3Mgd291bGQg
d29yawo+ID4gT0staXNoIHdpdGggYSByZW1vdGUgdGVybWluYWwgdGhhdCB1c2VkIGFueSBvZiBD
UiwgQ1IrTEYsIG9yIExGIGFzIGEKPiA+IGxpbmUgZW5kaW5nLiBTb21lb25lIHVzaW5nIENSIGFz
IGEgbGluZSBlbmRpbmcgbWlnaHQgZ2V0IHNvbWUgdWdsaW5lc3MKPiA+IHdoZXJlIGtkYiB3YXNu
J3QgYWJsZSB0byBvdmVyd3JpdGUgdGhlIGxhc3QgbGluZSwgYnV0IGJhc2ljIGNvbW1hbmRzCj4g
PiB3b3VsZCB3b3JrLiBTb21lb25lIHVzaW5nIGp1c3QgTEYgYXMgYSBsaW5lIGVuZGluZyB3b3Vs
ZCBwcm9iYWJseSBhbHNvCj4gPiB3b3JrIE9LLgo+ID4KPiA+IEEgZmV3IG90aGVyIG5vdGVzOgo+
ID4gLSBJdCBjYW4gYmUgbm90ZWQgdGhhdCAiYmFzaCIgcnVubmluZyBvbiBhbiAiYWdldHR5IiBo
YW5kbGVzIExGIGFzIGEKPiA+ICAgbGluZSB0ZXJtaW5hdGlvbiB3aXRoIG5vIGNvbXBsYWludHMu
Cj4gPiAtIEhpc3RvcmljYWxseSwga2RiJ3MgInBhZ2VyIiBhY3R1YWxseSBoYW5kbGVkIGVpdGhl
ciBDUiBvciBMRiBmaW5lLiBBCj4gPiAgIHZlcnkgcXVpY2sgaW5zcGVjdGlvbiB3b3VsZCBtYWtl
IG9uZSB0aGluayB0aGF0IGtkYidzIHBhZ2VyIGFjdHVhbGx5Cj4gPiAgIGNvdWxkIGhhdmUgcGFn
ZWQgZG93biB0d28gbGluZXMgaW5zdGVhZCBvZiBvbmUgZm9yIGFueW9uZSB1c2luZwo+ID4gICBD
UitMRiwgYnV0IHRoaXMgaXMgZ2VuZXJhbGx5IGF2b2lkZWQgYmVjYXVzZSBvZiBrZGJfaW5wdXRf
Zmx1c2goKS4KPgo+IFRoZXNlIGFyZSB2ZXJ5IGNvbnZpbmNpbmcgdGhvdWdoIQo+Cj4gPiAtIENv
bmNlaXZhYmx5IG9uZSBjb3VsZCBhcmd1ZSB0aGF0IHNvbWUgb2YgdGhpcyBzcGVjaWFsIGNhc2Ug
bG9naWMKPiA+ICAgYmVsb25ncyBpbiB1YXJ0X3BvbGxfZ2V0X2NoYXIoKSBzaW5jZSB1YXJ0X3Bv
bGxfcHV0X2NoYXIoKSBoYW5kbGVzCj4gPiAgIHRoZSAnXG4nID0+ICdcclxuJyBjb252ZXJzaW9u
LiBJIHdvdWxkIGFyZ3VlIHRoYXQgcGVyaGFwcyB3ZSBzaG91bGQKPiA+ICAgZXZlbnR1YWxseSBk
byB0aGUgb3Bwb3NpdGUgYW5kIG1vdmUgdGhlICdcbicgPT4gJ1xyXG4nIG91dCBvZgo+ID4gICB1
YXJ0X3BvbGxfcHV0X2NoYXIoKS4gSGF2aW5nIHRoYXQgY29udmVyc2lvbiBhdCBzdWNoIGEgbG93
IGxldmVsCj4gPiAgIGNvdWxkIGludGVyZmVyZSBpZiB3ZSBldmVyIHdhbnQgdG8gdHJhbnNmZXIg
YmluYXJ5IGRhdGEuIEluCj4gPiAgIGFkZGl0aW9uLCBpZiB3ZSB0cnVseSBtYWRlIHVhcnRfcG9s
bF9nZXRfY2hhcigpIHRoZSBpbnZlcnNlIG9mCj4gPiAgIHVhcnRfcG9sbF9wdXRfY2hhcigpIGl0
IHdvdWxkIGNvbnZlcnQgYmFjayB0byAnXG4nIGFuZCAoaXJvbmljYWxseSkKPiA+ICAga2RiJ3Mg
cGFyc2VyIGN1cnJlbnRseSBvbmx5IGxvb2tzIGZvciAnXHInIHRvIGZpbmQgdGhlIGVuZCBvZiBh
Cj4gPiAgIGNvbW1hbmQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+Cj4gVGhpcyBhcnJpdmVkIGp1c3QgYXMgSSB3YXMgZ2F0
aGVyaW5nIHVwIHRoZSBwYXRjaGVzIChJIGtub3cuLi4gcnVubmluZwo+IGxhdGUpLiBJJ3ZlIGFk
ZGVkIGEgY291cGxlIG9mIGNhc2VzIHRvIHRoZSB0ZXN0IHN1aXRlIHRvIGNvdmVyIHRoZQo+IG5l
dyBmZWF0dXJlLgo+Cj4gVGhlIGNvZGUgbG9va3MgZ29vZCB0byBtZS4gQXJlIHlvdSBoYXBweSBm
b3IgbWUgdG8gdGFrZSBpdCB0aGlzCj4gbWVyZ2UgY3ljbGU/CgpZZWFoLCBpdCBzaG91bGQgYmUg
T0suIEl0J3MgcmVhbGx5IHByZXR0eSBzdHJhaWdodGZvcndhcmQuIFRoYW5rcyEKCi1Eb3VnCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdy
ZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9y
dAo=
