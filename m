Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6109272FAE1
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Jun 2023 12:29:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q9Nkv-0002SR-5r
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 14 Jun 2023 10:29:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q9Nkp-0002S6-Jl
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Jun 2023 10:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rhRpOEE0FKxbTYX/Job7y10yZH4TueIGHLBhWciCR2w=; b=clEaCx8wdNCQIoSyu9stjdGfHw
 NSkTKAyl2jX2XWKwGp+ka+FRN058ol1JLMEHlEn8kYPN9Dcqr7Oqv7uu7zrFXRYU5/JlSBYyPR2EP
 S1i7ELn/7wLsYYk7TrCV7Bbkop5C+2WanbkP8WPc0NTcNy06uMlOZbWI94bpbO4h8HNA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rhRpOEE0FKxbTYX/Job7y10yZH4TueIGHLBhWciCR2w=; b=hgM1h3UD2ZJBFEM0X5ZXK265jA
 JPzh4tqKuXSTPexEhM5+D9hVSrVWDAOLQzsZY9q16q2o3mJPErCKtnN33NQdTlrcsHpmFtb1tphCr
 KS3sHdLLJC9PlAZzoA14g9EOtHwVr9Kw80WDytX/hRrpRB3/JTsUfDFGVdZ7mw9cH9Z0=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q9Nkl-002q6q-NI for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Jun 2023 10:29:31 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 653CF21C83;
 Wed, 14 Jun 2023 10:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1686738557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rhRpOEE0FKxbTYX/Job7y10yZH4TueIGHLBhWciCR2w=;
 b=jJ+ALNsoAPJuxj3+WmnJdYwDSPIw7fH3gY97cONrkYcvme6b6gIAlQILJQKaiEWZBDWE+y
 +5lNxbi2GlKwyPHV7zJEe68SriHx/afjuWaMhBfIPlhAZcuY/XGLQQc91eFEcIXkoRCR8r
 XdyKtXz+yrqwb0V6rw5zk3u7kHRIQ0E=
Received: from suse.cz (pmladek.udp.ovpn2.prg.suse.de [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 55CB82C141;
 Wed, 14 Jun 2023 10:29:15 +0000 (UTC)
Date: Wed, 14 Jun 2023 12:29:11 +0200
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZImWd62fXjsZildv@alley>
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-3-pmladek@suse.com>
 <CAD=FV=WRzaLbLQ65usGeFq3ya=DV8cYyHQina_721EFoSTdBGA@mail.gmail.com>
 <ZIG1Qi0iUjTKICQM@alley>
 <CAD=FV=XzueJia--Zv4cAofzk7yocmP-7K8wa4doAN8pzED_hZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=XzueJia--Zv4cAofzk7yocmP-7K8wa4doAN8pzED_hZA@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu 2023-06-08 06:55:23, Doug Anderson wrote: > Hi, > >
    On Thu, Jun 8, 2023 at 4:02 AM Petr Mladek <pmladek@suse.com> wrote: >
   > > > > > config HARDLOCKUP_DETECTOR > > > > bool "Detect Hard Locku [...]
    
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [195.135.220.28 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q9Nkl-002q6q-NI
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

T24gVGh1IDIwMjMtMDYtMDggMDY6NTU6MjMsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gSGksCj4g
Cj4gT24gVGh1LCBKdW4gOCwgMjAyMyBhdCA0OjAy4oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFkZWtA
c3VzZS5jb20+IHdyb3RlOgo+ID4KPiA+ID4gPiAgY29uZmlnIEhBUkRMT0NLVVBfREVURUNUT1IK
PiA+ID4gPiAgICAgICAgIGJvb2wgIkRldGVjdCBIYXJkIExvY2t1cHMiCj4gPiA+ID4gICAgICAg
ICBkZXBlbmRzIG9uIERFQlVHX0tFUk5FTCAmJiAhUzM5MAo+ID4gPiA+IC0gICAgICAgZGVwZW5k
cyBvbiBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfTk9OX0FSQ0ggfHwgSEFWRV9IQVJETE9DS1VQ
X0RFVEVDVE9SX0FSQ0gKPiA+ID4gPiArICAgICAgIGRlcGVuZHMgb24gKChIQVZFX0hBUkRMT0NL
VVBfREVURUNUT1JfUEVSRiB8fCBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfQlVERFkpICYmICFI
QVZFX05NSV9XQVRDSERPRykgfHwgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0gKPiA+ID4K
PiA+ID4gQWRkaW5nIHRoZSBkZXBlbmRlbmN5IHRvIGJ1ZGR5IChzZWUgYWJsb3ZlKSB3b3VsZCBz
aW1wbGlmeSB0aGUgYWJvdmUKPiA+ID4gdG8ganVzdCB0aGlzOgo+ID4gPgo+ID4gPiBkZXBlbmRz
IG9uIEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGIHx8Cj4gPiA+IEhBVkVfSEFSRExPQ0tV
UF9ERVRFQ1RPUl9CVUREWSB8fCBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfQVJDSAo+ID4KPiA+
IFRoaXMgaXMgZXhhY3RseSB3aGF0IEkgZG8gbm90IHdhbnQuIEl0IHdvdWxkIGp1c3QgbW92ZSB0
aGUgY2hlY2sKPiA+IHNvbWV3aGVyZSBlbHNlLiBCdXQgaXQgd291bGQgbWFrZSB0aGUgbG9naWMg
aGFyZGVyIHRvIHVuZGVyc3RhbmQuCj4gCj4gSG1tbS4gVG8gbWUsIGl0IGZlbHQgZWFzaWVyIHRv
IHVuZGVyc3RhbmQgYnkgbW92aW5nIHRoaXMgaW50byB0aGUKPiAiSEFWRV9IQVJETE9DS1VQX0RF
VEVDVE9SX0JVRERZIi4gVG8gbWUgaXQgd2FzIHByZXR0eSBlYXN5IHRvIHNheSAiaWYKPiBhbiBh
cmNoaXRlY3R1cmUgZGVmaW5lZCBpdHMgb3duIGFyY2gtc3BlY2lmaWMgd2F0Y2hkb2cgdGhlbiBi
dWRkeQo+IGNhbid0IGJlIGVuYWJsZWQiIGFuZCB0aGF0IGZlbHQgbGlrZSBpdCBmaXQgY2xlYW5s
eSB3aXRoaW4gdGhlCj4gIkhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9CVUREWSIgZGVmaW5pdGlv
bi4gSXQgZ290IHJpZCBvZiBfYSBsb3RfIG9mCj4gb3RoZXIgc3BlY2lhbCBjYXNlcyAvIGNoZWNr
cyBlbHNld2hlcmUgYW5kIGZlbHQgcXVpdGUgYSBiaXQgY2xlYW5lciB0bwo+IG1lLiBJIG9ubHkg
aGFkIHRvIHRoaW5rIGFib3V0IHRoZSBjb25mbGljdCBiZXR3ZWVuIHRoZSAiYnVkZHkiIGFuZAo+
ICJubWkiIHdhdGNoZG9ncyBvbmNlIHdoZW4gSSB1bmRlcnN0b29kCj4gIkhBVkVfSEFSRExPQ0tV
UF9ERVRFQ1RPUl9CVUREWSIuCgpJIHNlZS4gTXkgcHJvYmxlbSB3aXRoIHRoaXMgYXBwcm9hY2gg
d2FzIHRoYXQgdGhlIGRlcGVuZGVuY2llcyBiZXR3ZWVuCnRoZSA0IGFsdGVybmF0aXZlIGltcGxl
bWVudGF0aW9ucyB3ZXJlIHRvbyBkaXN0cmlidXRlZC4gSXQgd2FzCm5lY2Vzc2FyeSByZWFkIG1h
bnkgZGVmaW5pdGlvbnMgdG8gdW5kZXJzdGFuZCB3aGF0IHdhcyBwb3NzaWJsZSBhbmQKd2hhdCB3
YXMgbm90IHBvc3NpYmxlLiBBbmQgaXQgaXMgZXZlbiBtb3JlIGNvbXBsaWNhdGVkIHdoZW4KY3Nj
b3BlIGRvZXMgbm90IHN1cHBvcnQgS2NvbmZpZy4KCkFsc28gdGhlIGFib3ZlIHNvbHZlcyB0aGUg
YnVkZHkgZGV0ZWN0b3Igd2hpY2ggaXMgZ2xvYmFsLgoKVGhlIHNhbWUgY29uZmxpY3QgaGFzIFBF
UkYgd2hpY2ggaGFzIGFyY2gtc3BlY2lmaWMgZGVwZW5kZW5jaWVzLgpNYXliZSwgaXQgY2FuIGJl
IGRpc2FibGVkIGJ5IGEgY29uZmxpY3QgaW4gdGhlIGFyY2gvS2NvbmZpZy4KQnV0IHRoZW4gdGhl
IFBFUkYgZGVwZW5kZW5jaWVzIHdvdWxkIGJlIHNwbGl0IGludG8gMyBjb25maWcKZmlsZXM6IGFy
Y2gvS2NvbmZpZywgbGliL0tjb25maWcuZGVidWcsIGFyY2gvS2NvbmZpZy8uCgpBbnl3YXksIEhB
VkVfKl9CVUREWSBhbmQgSEFWRV8qX1BFUkYgc2hvdWxkIGJlaGF2ZSB0aGUgc2FtZS4KQm90aCBz
aG91bGQgZWl0aGVyIGV4cGxpY2l0bHkgY29uZmxpY3Qgd2l0aCBIQVZFXypfQVJDSAphbmQgSEFW
RV9OTUlfV0FUQ0hET0cuIE9yIHRoZXkgYm90aCBzaG91bGQgYmUgZW5hYmxlZCB3aGVuCnRoZXkg
YXJlIHN1cHBvcnRlZCBieSB0aGUgYXJjaGl0ZWN0dXJlIGFuZCBqdXN0IGlnbm9yZWQgd2hlbgpj
aG9vc2luZyB0aGUgZmluYWwgaW1wbGVtZW50YXRpb24uCgpNeSB3aXNoIHdhcyB0byBoYXZlIGNv
bnNpc3RlbnQgbmFtaW5nOgoKICAgKyBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfPGltcGw+IHNl
dCB3aGVuIHRoZSB0aGUgYXJjaGl0ZWN0dXJlCiAgICAgICBzdXBwb3J0cyB0aGUgcGFydGljdWxh
ciBpbXBsZW1lbnRhdGlvbi4KCiAgKyBIQVJETE9DS1VQX0RFVEVDVE9SXzxpbXBsPiBzZXQgd2hl
biB0aGUgaW1wbGVtZW50YXRpb24gd2lsbAogICAgICAgYmUgdXNlZCAoYnVpbHQpLgoKClN0ZXAg
YXNpZGU6CgpJdCBzZWVtcyB0aGF0IHdlIGhhdmUgZW50ZXJlZCBpbnRvIGEgYmlrZSBzaGVkZGlu
ZyBtb2RlLgpUaGUgZm9sbG93aW5nIHF1ZXN0aW9ucyBjb21lIHRvIG15IG1pbmQ6CgogICAxLiBE
b2VzIHRoaXMgcGF0Y2hzZXQgaW1wcm92ZSB0aGUgY3VycmVudCBzdGF0ZT8KCiAgIDIuIE1heWJl
LCBpdCBpcyBub3QgYmxhY2smd2hpdGUuIElzIGl0IHBvc3NpYmxlIHRvIHN1bW1hcml6ZQogICAg
ICB3aGF0IGV4YWN0bHkgZ290IGJldHRlciBhbmQgd2hhdCBnb3Qgd29yc2U/CgpNYXliZSwgdGhl
cmUgaXMgbm8gbmVlZCB0byBkbyBiaWtlLXNoZWRkaW5nIGFib3V0IGV2ZXJ5IHN0ZXAKaWYgdGhl
IGZpbmFsIHJlc3VsdCBpcyByZWFzb25hYmxlIGFuZCB0aGUgc3RlcHMgYXJlIG5vdApjb21wbGV0
ZWx5IHdyb25nLgoKSSBqdXN0IGZvbGxvd2VkIG15IGludHVpdGlvbiBhbmQgdHJpZWQgdG8gZG8g
c29tZSBjaGFuZ2VzIHN0ZXAKYnkgc3RlcC4gSSBnb3QgbG9zdCBtYW55IHRpbWVzIHNvIG1heWJl
IHRoZSBzdGVwcyBhcmUgbm90CmlkZWFsLiBBbnl3YXksIHRoZSBzdGVwcyBoZWxwZWQgbWUgdG8g
dW5kZXJzdGFuZCB0aGUgbG9naWMKYW5kIHN0YXkgcmVhc29uYWJseSBjb25maWRlbnQgdGhhdCB0
aGV5IGRpZCBub3QgY2hhbmdlCnRoZSBiZWhhdmlvci4KCkkgY291bGQgcmV3b3JrIHRoZSBwYXRj
aHNldC4gQnV0IEkgZmlyc3QgbmVlZCB0byBrbm93IHdoYXQKZXhhY3RseSBpcyBiYWQgaW4gdGhl
IHJlc3VsdC4gQW5kIGV2ZW50dWFsbHkgaWYgdGhlcmUgaXMgbW9yZQpsb2dpY2FsIHdheSBob3cg
dG8gZW5kIHRoZXJlLgoKQmVzdCBSZWdhcmRzLApQZXRyCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0Cktn
ZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
