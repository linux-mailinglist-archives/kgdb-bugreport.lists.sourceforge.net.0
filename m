Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8878727D73
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  8 Jun 2023 13:02:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q7DPc-0000fm-P2
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 08 Jun 2023 11:02:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q7DPb-0000fg-3R
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6g44MDDH9tfB/XpM0/EESISEKQiRS6U0QnFvaGcmzdk=; b=QMHUTTyNtqGGpCRHkcUcsl+UdH
 eC5oCxrHK48kzl+kaLipsb+1VaeTT3LgSy8FPoM8q2fLVOSas9+Gc+JRyTdI2AM+Li9TBJF1haSKJ
 e+mjV3deMqJdHhriFp3VgmwEw+ivoZfGrBeW0kGQrQ8FGJXkNg+rw9b2NLTpdKNXSD9k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6g44MDDH9tfB/XpM0/EESISEKQiRS6U0QnFvaGcmzdk=; b=Y9aoNxyEPV9yO1Eiuu+5OromXz
 MzRvkH1Omt8K75hgN37tGCEzVCnmH5aW8HndmFhko1W4LizZoo1f1VfwVIKx8yYBzmb9JKC2WikdL
 sIDpORpft/yuE3spdAl+iBm1JnLdkHBjVBgFeDC5OprhttC2eVh1b4/GJfGsgQp/ey4k=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q7DPZ-0000M0-8C for kgdb-bugreport@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:02:39 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 722EC1FDE2;
 Thu,  8 Jun 2023 11:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1686222147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6g44MDDH9tfB/XpM0/EESISEKQiRS6U0QnFvaGcmzdk=;
 b=CCLKjh4l086lb/mfvsw8O378/hEr9vO/2QT8GYe9J9S/ENCObCwIhDoN0A8TCMonSEPAkF
 NYZZCOgVX0xxpN+/I41wO4gktn2BkEypvV6mCUFLMhGH6Lie8tFWk9aANtZJqOZH95HZFv
 n9GWwORRzUw0ojKl1Ui++tV2Z8p66P0=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 012D62C141;
 Thu,  8 Jun 2023 11:02:26 +0000 (UTC)
Date: Thu, 8 Jun 2023 13:02:26 +0200
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZIG1Qi0iUjTKICQM@alley>
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-3-pmladek@suse.com>
 <CAD=FV=WRzaLbLQ65usGeFq3ya=DV8cYyHQina_721EFoSTdBGA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=WRzaLbLQ65usGeFq3ya=DV8cYyHQina_721EFoSTdBGA@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed 2023-06-07 16:35:09, Doug Anderson wrote: > Hi, > >
    On Wed, Jun 7, 2023 at 8:25 AM Petr Mladek <pmladek@suse.com> wrote: >
   > > > diff --git a/arch/Kconfig b/arch/Kconfig > > index 422f0ffa269 [...]
    
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [195.135.220.29 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1q7DPZ-0000M0-8C
Subject: Re: [Kgdb-bugreport] [PATCH 2/7] watchdog/hardlockup: Make the
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gV2VkIDIwMjMtMDYtMDcgMTY6MzU6MDksIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gSGksCj4g
Cj4gT24gV2VkLCBKdW4gNywgMjAyMyBhdCA4OjI14oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFkZWtA
c3VzZS5jb20+IHdyb3RlOgo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL0tjb25maWcgYi9hcmNo
L0tjb25maWcKPiA+IGluZGV4IDQyMmYwZmZhMjY5ZS4uMTNjNmU1OTZjZjllIDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9LY29uZmlnCj4gPiArKysgYi9hcmNoL0tjb25maWcKPiA+IEBAIC00MDQsMTcg
KzQwNCwyNyBAQCBjb25maWcgSEFWRV9OTUlfV0FUQ0hET0cKPiA+ICAgICAgICAgZGVwZW5kcyBv
biBIQVZFX05NSQo+ID4gICAgICAgICBib29sCj4gPiAgICAgICAgIGhlbHAKPiA+IC0gICAgICAg
ICBUaGUgYXJjaCBwcm92aWRlcyBhIGxvdyBsZXZlbCBOTUkgd2F0Y2hkb2cuIEl0IHByb3ZpZGVz
Cj4gPiAtICAgICAgICAgYXNtL25taS5oLCBhbmQgZGVmaW5lcyBpdHMgb3duIHdhdGNoZG9nX2hh
cmRsb2NrdXBfcHJvYmUoKSBhbmQKPiA+IC0gICAgICAgICBhcmNoX3RvdWNoX25taV93YXRjaGRv
ZygpLgo+ID4gKyAgICAgICAgIFRoZSBhcmNoIHByb3ZpZGVzIGl0cyBvd24gaGFyZGxvY2t1cCBk
ZXRlY3RvciBpbXBsZW1lbnRhdGlvbiBpbnN0ZWFkCj4gPiArICAgICAgICAgb2YgdGhlIGdlbmVy
aWMgcGVyZiBvbmUuCj4gCj4gbml0OiBkaWQgeW91IG1lYW4gdG8gaGF2ZSBkaWZmZXJlbnQgd29y
ZGluZyBoZXJlIGNvbXBhcmVkIHRvCj4gSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0g/IEhl
cmUgeW91IHNheSAidGhlIGdlbmVyaWMgcGVyZiBvbmUiIGFuZAo+IHRoZXJlIHlvdSBzYXkgInRo
ZSBnZW5lcmljIG9uZXMiLCB0aG91Z2ggaXQgc2VlbXMgbGlrZSB5b3UgbWVhbiB0aGVtCj4gdG8g
YmUgdGhlIHNhbWUuCgpHb29kIHBvaW50LCBJJ2xsIGZpeCBpdCBpbiB2Mi4KCj4gPiBkaWZmIC0t
Z2l0IGEvbGliL0tjb25maWcuZGVidWcgYi9saWIvS2NvbmZpZy5kZWJ1Zwo+ID4gaW5kZXggM2U5
MWZhMzNjN2EwLi5kMjAxZjVkMzg3NmIgMTAwNjQ0Cj4gPiAtLS0gYS9saWIvS2NvbmZpZy5kZWJ1
Zwo+ID4gKysrIGIvbGliL0tjb25maWcuZGVidWcKPiA+IEBAIC0xMDM1LDE2ICsxMDM1LDMzIEBA
IGNvbmZpZyBCT09UUEFSQU1fU09GVExPQ0tVUF9QQU5JQwo+ID4KPiA+ICAgICAgICAgICBTYXkg
TiBpZiB1bnN1cmUuCj4gPgo+ID4gK2NvbmZpZyBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfQlVE
RFkKPiA+ICsgICAgICAgYm9vbAo+ID4gKyAgICAgICBkZXBlbmRzIG9uIFNNUAo+ID4gKyAgICAg
ICBkZWZhdWx0IHkKPiAKPiBJIHRoaW5rIHlvdSBzaW1wbGlmeSB5b3VyIGxpZmUgaWYgeW91IGFs
c28gYWRkOgo+IAo+ICAgZGVwZW5kcyBvbiAhSEFWRV9OTUlfV0FUQ0hET0cKPiAKPiBUaGUgZXhp
c3RpbmcgY29uZmlnIHN5c3RlbSBoYXMgYWx3YXlzIGFzc3VtZWQgdGhhdCBubyBhcmNoaXRlY3R1
cmUKPiBkZWZpbmVzIGJvdGggSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYgYW5kIEhBVkVf
Tk1JX1dBVENIRE9HCj4gKHN5bWJvbHMgd291bGQgaGF2ZSBjbGFzaGVkIGFuZCB5b3Ugd291bGQg
Z2V0IGEgbGluayBlcnJvciBhcyB0d28KPiB3YXRjaGRvZ3MgdHJ5IHRvIGltcGxlbWVudCB0aGUg
c2FtZSB3ZWFrIHN5bWJvbCkuIElmIHlvdSBhZGQgdGhlIGV4dHJhCj4gZGVwZW5kZW5jeSB0byAi
YnVkZHkiIGFzIHBlciBhYm92ZSwgdGhlbiBhIGZldyB0aGluZ3MgYmVsb3cgZmFsbCBvdXQuCj4g
SSdsbCB0cnkgdG8gcG9pbnQgdGhlbSBvdXQgYmVsb3cuCgpNeSBhaW0gaXMgdG8gaGF2ZSB0d28g
dmFyaWFibGVzIHdpdGggYW5kIHdpdGhvdXQgSEFWRV8qIHByZWZpeApmb3IgZWFjaCB2YXJpYW50
LiBUaGV5IGFscmVhZHkgZXhpc3RlZCBmb3IgcGVyZjoKCiAgICsgSEFWRV9IQVJETE9DS1VQX0RF
VEVDVE9SX1BFUkYgbWVhbnMgdGhhdCBpdCBpcyBzdXBwb3J0ZWQgYnkgdGhlIGFyY2guCiAgICsg
SEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGIG1lYW5zIHRoYXQgaXQgd2lsbCByZWFsbHkgYmUgYnVp
bHQuCgoxLiBJdCB3aWxsIG1ha2UgaXQgY2xlYXIgd2hhdCB2YXJpYW50cyBhcmUgYXZhaWxhYmxl
IG9uIHRoZSBnaXZlIHN5c3RlbS4KICAgQW5kIGl0IHdpbGwgbWFrZSBpdCBjbGVhciB3aGF0IHZh
cmlhbnQgaXMgdXNlZCBpbiB0aGUgZW5kLgoKMi4gSXQgYWxsb3dzIHRvIGFkZCB0aGUgZGVwZW5k
ZWN5IG9uIHRoZSBnbG9iYWwgc3dpdGNoIEhBUkRMT0NLVVBfREVURUNUT1IuCiAgIEl0IG1ha2Vz
IGl0IGNsZWFyIHRoYXQgdGhlIGRldGVjdG9yIGNvdWxkIGJlIGRpc2FibGVkIGJ5IHRoaXMgc3dp
dGNoLgogICBBbHNvIGl0IGFjdHVhbGx5IGFsbG93cyB0byB1c2UgYm90aCB0b3AtYm90dG9tIGxv
Z2ljIGFuZCBDLWxpa2UKICAgZGVmaW5pdGlvbiBvcmRlcmluZy4KCgo+IAo+ID4gKwo+ID4gICMK
PiA+IC0jIGFyY2gvIGNhbiBkZWZpbmUgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0ggdG8g
cHJvdmlkZSB0aGVpciBvd24gaGFyZAo+ID4gLSMgbG9ja3VwIGRldGVjdG9yIHJhdGhlciB0aGFu
IHRoZSBwZXJmIGJhc2VkIGRldGVjdG9yLgo+ID4gKyMgR2xvYmFsIHN3aXRjaCB3aGV0aGVyIHRv
IGJ1aWxkIGEgaGFyZGxvY2t1cCBkZXRlY3RvciBhdCBhbGwuIEl0IGlzIGF2YWlsYWJsZQo+ID4g
KyMgb25seSB3aGVuIHRoZSBhcmNoaXRlY3R1cmUgc3VwcG9ydHMgYXQgbGVhc3Qgb25lIGltcGxl
bWVudGF0aW9uLiBUaGVyZSBhcmUKPiA+ICsjIHR3byBleGNlcHRpb25zLiBUaGUgaGFyZGxvY2t1
cCBkZXRlY3RvciBpcyBuZXdlciBlbmFibGVkIG9uOgo+IAo+IHMvbmV3ZXIvbmV2ZXIvCgpHcmVh
dCBjYXRjaC4gV2lsbCBmaXggaW4gdjIuCgo+ID4gKyMKPiA+ICsjICAgICAgczM5MDogaXQgcmVw
b3J0ZWQgbWFueSBmYWxzZSBwb3NpdGl2ZXMgdGhlcmUKPiA+ICsjCj4gPiArIyAgICAgIHNwYXJj
NjQ6IGhhcyBhIGN1c3RvbSBpbXBsZW1lbnRhdGlvbiB3aGljaCBpcyBub3QgdXNpbmcgdGhlIGNv
bW1vbgo+ID4gKyMgICAgICAgICAgICAgIGhhcmRsb2NrdXAgY29tbWFuZCBsaW5lIG9wdGlvbnMg
YW5kIHN5c2N0bCBpbnRlcmZhY2UuCj4gPiArIwo+ID4gKyMgTm90ZSB0aGF0IEhBVkVfTk1JX1dB
VENIRE9HIGlzIHVzZWQgdG8gZGlzdGluZ3Vpc2ggdGhlIHNwYXJjNjQgc3BlY2lmaWMKPiA+ICsj
IGltcGxlbWVudGFpb24uIEl0IGlzIGF1dG9tYXRpY2FsbHkgZW5hYmxlZCBhbHNvIGZvciBvdGhl
ciBhcmNoLXNwZWNpZmljCj4gPiArIyB2YXJpYW50cyB3aGljaCBzZXQgSEFWRV9IQVJETE9DS1VQ
X0RFVEVDVE9SX0FSQ0guIEl0IG1ha2VzIHRoZSBjaGVjawo+ID4gKyMgb2YgYXZhaWFsYWJsZSBh
bmQgc3VwcG9ydGVkIHZhcmlhbnRzIHF1aXRlIHRyaWNreS4KPiA+ICAjCj4gPiAgY29uZmlnIEhB
UkRMT0NLVVBfREVURUNUT1IKPiA+ICAgICAgICAgYm9vbCAiRGV0ZWN0IEhhcmQgTG9ja3VwcyIK
PiA+ICAgICAgICAgZGVwZW5kcyBvbiBERUJVR19LRVJORUwgJiYgIVMzOTAKPiA+IC0gICAgICAg
ZGVwZW5kcyBvbiBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfTk9OX0FSQ0ggfHwgSEFWRV9IQVJE
TE9DS1VQX0RFVEVDVE9SX0FSQ0gKPiA+ICsgICAgICAgZGVwZW5kcyBvbiAoKEhBVkVfSEFSRExP
Q0tVUF9ERVRFQ1RPUl9QRVJGIHx8IEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9CVUREWSkgJiYg
IUhBVkVfTk1JX1dBVENIRE9HKSB8fCBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfQVJDSAo+IAo+
IEFkZGluZyB0aGUgZGVwZW5kZW5jeSB0byBidWRkeSAoc2VlIGFibG92ZSkgd291bGQgc2ltcGxp
ZnkgdGhlIGFib3ZlCj4gdG8ganVzdCB0aGlzOgo+IAo+IGRlcGVuZHMgb24gSEFWRV9IQVJETE9D
S1VQX0RFVEVDVE9SX1BFUkYgfHwKPiBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfQlVERFkgfHwg
SEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0gKClRoaXMgaXMgZXhhY3RseSB3aGF0IEkgZG8g
bm90IHdhbnQuIEl0IHdvdWxkIGp1c3QgbW92ZSB0aGUgY2hlY2sKc29tZXdoZXJlIGVsc2UuIEJ1
dCBpdCB3b3VsZCBtYWtlIHRoZSBsb2dpYyBoYXJkZXIgdG8gdW5kZXJzdGFuZC4KRXNwZWNpYWxs
eSB3aGVuIHRoZSByZWxhdGVkIGRlZmluaXRpb25zIGNvdWxkIG5vdCBiZSBmb3VuZCBieSBjc2Nv
cGUuCgo+IEFzIHBlciBhYm92ZSwgaXQncyBzaW1wbHkgYSByZXNwb25zaWJpbGl0eSBvZiBhcmNo
aXRlY3R1cmVzIG5vdCB0bwo+IGRlZmluZSB0aGF0IHRoZXkgaGF2ZSBib3RoICJwZXJmIiBpZiB0
aGV5IGhhdmUgdGhlIE5NSSB3YXRjaGRvZywgc28KPiBpdCdzIGp1c3QgYnVkZHkgdG8gd29ycnkg
YWJvdXQuCgpXaGVyZSBpcyB0aGlzIGRvY3VtZW50ZWQsIHBsZWFzZT8KSXMgaXQgc2FmZSB0byBh
c3N1bWUgdGhpcz8KCkkgd291bGQgcGVyc29uYWxseSBwcmVmZXIgdG8gZW5zdXJlIHRoaXMgYnkg
dGhlIGNvbmZpZyBjaGVjay4KSXQgaXMgZXZlbiBiZXR0ZXIgdGhhbiBkb2N1bWVudGF0aW9uIGJl
Y2F1c2Ugbm9ib2R5IHJlYWRzCmRvY3VtZW50YXRpb24gOy0pCgpJdCB0b29rIG1lIGxvbmcgdGlt
ZSB0byB1bmRlcnN0YW5kIGFsbCB0aGUgZGVwZW5kZW5jaWVzIGFuZApwb3NzaWJpbGl0aWVzLiBN
eSBtb3RpdmF0aW9uIGlzIHRoYXQgbmVpdGhlciBtZSBub3Igb3RoZXJzCndvdWxkIG5lZWQgdG8g
YWJzb2x2ZSB0aGUgc2FtZSBhZHZlbnR1cmUgaW4gdGhlIGZ1dHVyZS4KCj4gCj4gPiArICAgICAg
IGltcGx5IEhBUkRMT0NLVVBfREVURUNUT1JfUEVSRgo+ID4gKyAgICAgICBpbXBseSBIQVJETE9D
S1VQX0RFVEVDVE9SX0JVRERZCj4gPiAgICAgICAgIHNlbGVjdCBMT0NLVVBfREVURUNUT1IKPiA+
IC0gICAgICAgc2VsZWN0IEhBUkRMT0NLVVBfREVURUNUT1JfTk9OX0FSQ0ggaWYgSEFWRV9IQVJE
TE9DS1VQX0RFVEVDVE9SX05PTl9BUkNICj4gPgo+ID4gICAgICAgICBoZWxwCj4gPiAgICAgICAg
ICAgU2F5IFkgaGVyZSB0byBlbmFibGUgdGhlIGtlcm5lbCB0byBhY3QgYXMgYSB3YXRjaGRvZyB0
byBkZXRlY3QKPiA+IEBAIC0xMDU1LDkgKzEwNzIsMTUgQEAgY29uZmlnIEhBUkRMT0NLVVBfREVU
RUNUT1IKPiA+ICAgICAgICAgICBjaGFuY2UgdG8gcnVuLiAgVGhlIGN1cnJlbnQgc3RhY2sgdHJh
Y2UgaXMgZGlzcGxheWVkIHVwb24gZGV0ZWN0aW9uCj4gPiAgICAgICAgICAgYW5kIHRoZSBzeXN0
ZW0gd2lsbCBzdGF5IGxvY2tlZCB1cC4KPiA+Cj4gPiArIwo+ID4gKyMgTm90ZSB0aGF0IGFyY2gt
c3BlY2lmaWMgdmFyaWFudHMgYXJlIGFsd2F5cyBwcmVmZXJyZWQuCj4gPiArIwo+ID4gIGNvbmZp
ZyBIQVJETE9DS1VQX0RFVEVDVE9SX1BSRUZFUl9CVUREWQo+ID4gICAgICAgICBib29sICJQcmVm
ZXIgdGhlIGJ1ZGR5IENQVSBoYXJkbG9ja3VwIGRldGVjdG9yIgo+ID4gLSAgICAgICBkZXBlbmRz
IG9uIEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGICYmIFNNUAo+ID4gKyAgICAgICBkZXBl
bmRzIG9uIEhBUkRMT0NLVVBfREVURUNUT1IKPiA+ICsgICAgICAgZGVwZW5kcyBvbiBIQVZFX0hB
UkRMT0NLVVBfREVURUNUT1JfUEVSRiAmJiBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfQlVERFkK
PiA+ICsgICAgICAgZGVwZW5kcyBvbiAhSEFWRV9OTUlfV0FUQ0hET0cKPiAKPiBDYW4gZ2V0IHJp
ZCBvZiBhYm92ZSAiIUhBVkVfTk1JX1dBVENIRE9HIiBpZiBpdCdzIGFkZGVkIHRvCj4gSEFWRV9I
QVJETE9DS1VQX0RFVEVDVE9SX0JVRERZLgoKSSB3b3VsZCBwcmVmZXIgdG8ga2VlcCBpdCBoZWFy
IHRvIG1ha2UgaXQgY2xlYXIgb24gdGhlIGZpcnN0IGxvb2suCgo+ID4gKyAgICAgICBkZWZhdWx0
IG4KPiAKPiBJJ20gcHJldHR5IHN1cmUgImRlZmF1bHQgbiIgaXNuJ3QgbmVlZGVkLgoKSSdsbCB0
cnkgYW5kIGZpeCBpbiB2Mi4KCj4gCj4gPiAgICAgICAgIGhlbHAKPiA+ICAgICAgICAgICBTYXkg
WSBoZXJlIHRvIHByZWZlciB0aGUgYnVkZHkgaGFyZGxvY2t1cCBkZXRlY3RvciBvdmVyIHRoZSBw
ZXJmIG9uZS4KPiA+Cj4gPiBAQCAtMTA3MSwzOSArMTA5NCwyNyBAQCBjb25maWcgSEFSRExPQ0tV
UF9ERVRFQ1RPUl9QUkVGRVJfQlVERFkKPiA+Cj4gPiAgY29uZmlnIEhBUkRMT0NLVVBfREVURUNU
T1JfUEVSRgo+ID4gICAgICAgICBib29sCj4gPiAtICAgICAgIGRlcGVuZHMgb24gSEFWRV9IQVJE
TE9DS1VQX0RFVEVDVE9SX1BFUkYKPiA+ICsgICAgICAgZGVwZW5kcyBvbiBIQVJETE9DS1VQX0RF
VEVDVE9SCj4gPiArICAgICAgIGRlcGVuZHMgb24gSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX1BF
UkYgJiYgIUhBUkRMT0NLVVBfREVURUNUT1JfUFJFRkVSX0JVRERZCj4gPiArICAgICAgIGRlcGVu
ZHMgb24gIUhBVkVfTk1JX1dBVENIRE9HCj4gCj4gV2UgZG9uJ3QgcmVhbGx5IG5lZWQgdGhlICIh
SEFWRV9OTUlfV0FUQ0hET0ciLiBBIHVzZXIgd291bGRuJ3QgYmUgYWJsZQo+IHRvIG1lc3MgdGhp
cyB1cCBhbmQgaXQncyB1cCB0byBhbiBhcmNoaXRlY3R1cmUgbm90IHRvIGRlZmluZSBib3RoCj4g
SEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYgYW5kIEhBVkVfTk1JX1dBVENIRE9HLgoKVGhp
cyBpcyBhbiBhc3N1bXB0aW9uIHRoYXQgb25seSBmZXcgcGVvcGxlIGtub3dzLiBJIHdvdWxkIHBy
ZWZlcgp0byBlbmZvcmNlIHRoaXMgYnkgdGhlIGNoZWNrLgoKPiBPdmVyYWxsLCB0aG91Z2gsIEkg
YWdyZWUgdGhhdCB0aGlzIGltcHJvdmVzIHRoaW5ncyEgVGhhbmtzISA6LSkKClRoYW5rcyBhIGxv
dCBmb3IgdGhlIHJldmlldy4gSSBkaWQgbXkgYmVzdCBhbmQgSSBnb3QgbG9zdCBtYW55IHRpbWVz
IDstKQoKQmVzdCBSZWdhcmRzLApQZXRyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVw
b3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
