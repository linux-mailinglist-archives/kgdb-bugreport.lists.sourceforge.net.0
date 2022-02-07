Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA144AB30D
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Feb 2022 02:19:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nGsgm-0006Fw-Hj
	for lists+kgdb-bugreport@lfdr.de; Mon, 07 Feb 2022 01:19:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mpe@ellerman.id.au>) id 1nGsgl-0006Fq-0s
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Feb 2022 01:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DVo9TFj10WHnIMP3upbM4NlbZB2TC5ggS49NOyVsTQo=; b=DxQRBpUyjZqyZFGI+bcJDRjGQp
 ztzm6ZbtDyJbOCLZ8q+oMmdEmJiwM/Nns7nNKPsKxYpzX04FvsAUQtddJNP3y5S5zAslIDDmr1f4c
 N3Qzptgt8E3p53DhRBEY9JeHnrlVbcDLSd5kHIbg/mdhzam2d7JOfzV9L0dgGPe/BVcE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DVo9TFj10WHnIMP3upbM4NlbZB2TC5ggS49NOyVsTQo=; b=ZNlBOoKe7A9FpX5W/+RbVNc+Pv
 5dq2oCqCi1mUaSp6pY8Un/UdM7ipgs7c6rwY+ND8sBX2c7NR4OIemP2t2zGnL7QBnEDS1JnTvPno1
 R+djGBdf9Tfu3LvYhusxoP2wMkelkGHlQWS22dQHURjuPNDxb336TPk0jacEnoIpZ1cQ=;
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nGsgf-0003vc-SQ
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Feb 2022 01:19:29 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JsSwK1MWyz4xcZ;
 Mon,  7 Feb 2022 12:19:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1644196753;
 bh=DVo9TFj10WHnIMP3upbM4NlbZB2TC5ggS49NOyVsTQo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fVv9D5FuEvLaNhfgmXgjlmjX4g5lOMemZmfYENVGDoppdX2Jo87qwVgAkhSIW0EP0
 89Lc++67+OIoMEwNxjvC50RgrjFDElHcPnLgKXuA5z1ZQiM++i/WE+BI+matwTnW2P
 91Ie3ar6Hr7cTtJ21ddl+Mbkp3WJslga+XRknX57rBaj+Wt1/rbTxjyAQqrUiUMLyq
 69wA8R2wfhA4KR8xTZG8HD3WRA+dYQp8A8q5D5TWDPWcWDmNGi2ZrHqlZZAor3hGwP
 gBZUprAx+25T1ngXxDkvVI01Gokid1upCSXRiWM4/lXk81+HjumKOlIxOkqLRh8iAA
 xnZSLLukqnG4w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <9cab4adb-bd4b-48d5-d63c-33a0f25c97e4@csgroup.eu>
References: <cover.1643282353.git.christophe.leroy@csgroup.eu>
 <a20285472ad0a0a13a1d93c4707180be5b4fa092.1643282353.git.christophe.leroy@csgroup.eu>
 <YfsVhcpVTW0+YCl5@bombadil.infradead.org>
 <87h79gmrux.fsf@mpe.ellerman.id.au>
 <9cab4adb-bd4b-48d5-d63c-33a0f25c97e4@csgroup.eu>
Date: Mon, 07 Feb 2022 12:19:06 +1100
Message-ID: <877da7mq2d.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Christophe Leroy <christophe.leroy@csgroup.eu> writes: > Le
    03/02/2022 à 06:39, Michael Ellerman a écrit : >> Luis Chamberlain <mcgrof@kernel.org>
    writes: >>> On Thu, Jan 27, 2022 at 11:28:12AM +00 [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nGsgf-0003vc-SQ
Subject: Re: [Kgdb-bugreport] [PATCH v2 5/5] powerpc: Select
 ARCH_WANTS_MODULES_DATA_IN_VMALLOC on book3s/32 and 8xx
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Q2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6Cj4g
TGUgMDMvMDIvMjAyMiDDoCAwNjozOSwgTWljaGFlbCBFbGxlcm1hbiBhIMOpY3JpdMKgOgo+PiBM
dWlzIENoYW1iZXJsYWluIDxtY2dyb2ZAa2VybmVsLm9yZz4gd3JpdGVzOgo+Pj4gT24gVGh1LCBK
YW4gMjcsIDIwMjIgYXQgMTE6Mjg6MTJBTSArMDAwMCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToK
Pj4+PiBib29rM3MvMzIgYW5kIDh4eCBoYXZlIGEgc2VwYXJhdGUgYXJlYSBmb3IgYWxsb2NhdGlu
ZyBtb2R1bGVzLAo+Pj4+IGRlZmluZWQgYnkgTU9EVUxFU19WQUREUiAvIE1PRFVMRVNfRU5ELgo+
Pj4+Cj4+Pj4gT24gYm9vazNzLzMyLCBpdCBpcyBub3QgcG9zc2libGUgdG8gcHJvdGVjdCBhZ2Fp
bnN0IGV4ZWN1dGlvbgo+Pj4+IG9uIGEgcGFnZSBiYXNpcy4gQSBmdWxsIDI1Nk0gc2VnbWVudCBp
cyBlaXRoZXIgRXhlYyBvciBOb0V4ZWMuCj4+Pj4gVGhlIG1vZHVsZSBhcmVhIGlzIGluIGFuIEV4
ZWMgc2VnbWVudCB3aGlsZSB2bWFsbG9jIGFyZWEgaXMKPj4+PiBpbiBhIE5vRXhlYyBzZWdtZW50
Lgo+Pj4+Cj4+Pj4gSW4gb3JkZXIgdG8gcHJvdGVjdCBtb2R1bGUgZGF0YSBhZ2FpbnN0IGV4ZWN1
dGlvbiwgc2VsZWN0Cj4+Pj4gQVJDSF9XQU5UU19NT0RVTEVTX0RBVEFfSU5fVk1BTExPQy4KPj4+
Pgo+Pj4+IEZvciB0aGUgOHh4IChhbmQgcG9zc2libHkgb3RoZXIgMzIgYml0cyBwbGF0Zm9ybSBp
biB0aGUgZnV0dXJlKSwKPj4+PiB0aGVyZSBpcyBubyBzdWNoIGNvbnN0cmFpbnQgb24gRXhlYy9O
b0V4ZWMgcHJvdGVjdGlvbiwgaG93ZXZlcgo+Pj4+IHRoZXJlIGlzIGEgY3JpdGljYWwgZGlzdGFu
Y2UgYmV0d2VlbiBrZXJuZWwgZnVuY3Rpb25zIGFuZCBjYWxsZXJzCj4+Pj4gdGhhdCBuZWVkcyB0
byByZW1haW4gYmVsb3cgMzJNYnl0ZXMgaW4gb3JkZXIgdG8gYXZvaWQgY29zdGx5Cj4+Pj4gdHJh
bXBvbGluZXMuIEJ5IGFsbG9jYXRpbmcgZGF0YSBvdXRzaWRlIG9mIG1vZHVsZSBhcmVhLCB3ZQo+
Pj4+IGluY3JlYXNlIHRoZSBjaGFuY2UgZm9yIG1vZHVsZSB0ZXh0IHRvIHJlbWFpbiB3aXRoaW4g
YWNjZXB0YWJsZQo+Pj4+IGRpc3RhbmNlIGZyb20ga2VybmVsIGNvcmUgdGV4dC4KPj4+Pgo+Pj4+
IFNvIHNlbGVjdCBBUkNIX1dBTlRTX01PRFVMRVNfREFUQV9JTl9WTUFMTE9DIGZvciA4eHggYXMg
d2VsbC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4KPj4+PiBDYzogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVy
bWFuLmlkLmF1Pgo+Pj4+IENjOiBCZW5qYW1pbiBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5j
cmFzaGluZy5vcmc+Cj4+Pj4gQ2M6IFBhdWwgTWFja2VycmFzIDxwYXVsdXNAc2FtYmEub3JnPgo+
Pj4KPj4+IENjIGxpc3QgZmlyc3QgYW5kIHRoZW4gdGhlIFNPQi4KPj4gCj4+IEp1c3QgZGVsZXRl
IHRoZSBDYzogbGlzdCwgaXQncyBtZWFuaW5nbGVzcy4KPj4gCj4KPiBXYXMgYW4gZWFzeSB3YXkg
dG8gY29weSB5b3UgYXV0b21hdGljYWxseSB3aXRoICdnaXQgc2VuZC1lbWFpbCcsIGJ1dCAKPiBn
ZXR0aW5nIGl0IHRocm91Z2ggbGludXhwcGMtZGV2IGxpc3QgaXMgZW5vdWdoIEkgZ3Vlc3MgPwoK
SXQncyB1c2VmdWwgZm9yIG1ha2luZyB0aGUgdG9vbGluZyBDYyB0aGUgcmlnaHQgcGVvcGxlLCBp
dCdzIGZpbmUgdG8gdXNlCnRoZW0gZm9yIHRoYXQuCgpCdXQgdGhlcmUncyBubyB2YWx1ZSBpbiBj
b21taXR0aW5nIHRoZW0gdG8gdGhlIGdpdCBoaXN0b3J5LCBJIGFjdGl2ZWx5CnN0cmlwIHRoZW0g
d2hlbiBhcHBseWluZy4gVGhlIGZhY3QgdGhhdCBzb21lb25lIGlzIENjJ2VkIG9uIGEgcGF0Y2gK
dGVsbHMgeW91IG5vdGhpbmcsIGdpdmVuIHRoZSB2b2x1bWUgb2YgbWFpbCBtYWludGFpbmVycyBy
ZWNlaXZlLgoKVGhlIGxpbmsgdGFnIGJhY2sgdG8gdGhlIG9yaWdpbmFsIHN1Ym1pc3Npb24gZ2l2
ZXMgeW91IHRoZSBDYyBsaXN0CmFueXdheS4KCmNoZWVycwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApL
Z2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
