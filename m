Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AB9727C9F
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  8 Jun 2023 12:19:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q7Cjl-0006Ly-GN
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 08 Jun 2023 10:19:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q7Cjf-0006Lr-Rn
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 08 Jun 2023 10:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qH7hbjRKkb1LYOldC3fpKEsvGCEPNOpUQ3QVueg8k94=; b=GIpcZ4sX3V2EOo3UoqDabORUQW
 sADK0Cp0Cb/aupVbN2GRl8ExILuZw5K5yZIKTEpsAo1C3DEsvgSIQWj/aqQpZFyhTwkWqWSg3NdCQ
 LpISefEYVrDsxG3cH4ZWjFNlE1Yu3C3SkWiAzmkzr8FA9tVVVJBdN8TklLnxj8NT5/Lw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qH7hbjRKkb1LYOldC3fpKEsvGCEPNOpUQ3QVueg8k94=; b=i21jr2rplRRMlfItaV02DiHNAj
 +VKwYUfzCpod4bCqBo6GxCChsZ3HXlHWAFZeEqhTDMEnmvLQiwiTo6rSBlzosDzauHRVMXf2gRr4d
 PRJERdCF2Uz+2ahWSRn0odj0r71G8P2VCnw0SuO5IqPssu00lGStKF3Rzua4QDo9rbVc=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q7Cjb-00Ebxf-LP for kgdb-bugreport@lists.sourceforge.net;
 Thu, 08 Jun 2023 10:19:20 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B432321A43;
 Thu,  8 Jun 2023 10:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1686219547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qH7hbjRKkb1LYOldC3fpKEsvGCEPNOpUQ3QVueg8k94=;
 b=ubBBzAI5Jfq44AopMPQk7sptKMpk3Olqv9uhKFbg+3Qb27Tdk/x97Pdyyc+g9TQwuCFTsM
 sxXE4W276BgmPZExKbxUU8w/ic4r8NBjuASLGMi/hqOy977FBzx5XUeDmft7/KnI19WFQl
 f0SCXK/ToeHSmXXB1qhFGEf3wPR4kmA=
Received: from suse.cz (pmladek.tcp.ovpn2.prg.suse.de [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 8228C2C141;
 Thu,  8 Jun 2023 10:19:06 +0000 (UTC)
Date: Thu, 8 Jun 2023 12:19:02 +0200
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZIGrFiGhUiO6OOsa@alley>
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-2-pmladek@suse.com>
 <CAD=FV=X4Sp=ZE4DWob-W0NzRm00K7wOWxyyCCaHUHNPPinsjhg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=X4Sp=ZE4DWob-W0NzRm00K7wOWxyyCCaHUHNPPinsjhg@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed 2023-06-07 16:34:20, Doug Anderson wrote: > Hi, > >
    On Wed, Jun 7, 2023 at 8:25 AM Petr Mladek <pmladek@suse.com> wrote: >
   > Only one hardlockup detector can be compiled in. The selection is [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1q7Cjb-00Ebxf-LP
Subject: Re: [Kgdb-bugreport] [PATCH 1/7] watchdog/hardlockup: Sort
 hardlockup detector related config values a logical way
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

T24gV2VkIDIwMjMtMDYtMDcgMTY6MzQ6MjAsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gSGksCj4g
Cj4gT24gV2VkLCBKdW4gNywgMjAyMyBhdCA4OjI14oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFkZWtA
c3VzZS5jb20+IHdyb3RlOgo+ID4gT25seSBvbmUgaGFyZGxvY2t1cCBkZXRlY3RvciBjYW4gYmUg
Y29tcGlsZWQgaW4uIFRoZSBzZWxlY3Rpb24gaXMgZG9uZQo+ID4gdXNpbmcgcXVpdGUgY29tcGxl
eCBkZXBlbmRlbmNpZXMgYmV0d2VlbiBzZXZlcmFsIENPTkZJRyB2YXJpYWJsZXMuCj4gPiBUaGUg
Zm9sbG93aW5nIHBhdGNoZXMgd2lsbCB0cnkgdG8gbWFrZSBpdCBtb3JlIHN0cmFpZ2h0Zm9yd2Fy
ZC4KPiA+Cj4gPiBBcyBhIGZpcnN0IHN0ZXAsIHJlb3JkZXIgdGhlIGRlZmluaXRpb25zIG9mIHRo
ZSB2YXJpb3VzIENPTkZJRyB2YXJpYWJsZXMuCj4gPiBUaGUgbG9naWNhbCBvcmRlciBpczoKPiA+
Cj4gPiAgICAxLiBIQVZFXyogdmFyaWFibGVzIGRlZmluZSBhdmFpbGFibGUgdmFyaWFudHMuIFRo
ZXkgYXJlIHR5cGljYWxseQo+ID4gICAgICAgZGVmaW5lZCBpbiB0aGUgYXJjaC8gY29uZmlnIGZp
bGVzLgo+ID4KPiA+ICAgIDIuIEhBUkRMT0NLVVBfREVURUNUT1IgeS9uIHZhcmlhYmxlIGRlZmlu
ZXMgd2hldGhlciB0aGUgaGFyZGxvY2t1cAo+ID4gICAgICAgZGV0ZWN0b3IgaXMgZW5hYmxlZCBh
dCBhbGwuCj4gPgo+ID4gICAgMy4gSEFSRExPQ0tVUF9ERVRFQ1RPUl9QUkVGRVJfQlVERFkgeS9u
IHZhcmlhYmxlIGRlZmluZXMgd2hldGhlcgo+ID4gICAgICAgdGhlIGJ1ZGR5IGRldGVjdG9yIHNo
b3VsZCBiZSBwcmVmZXJyZWQgb3ZlciB0aGUgcGVyZiBvbmUuCj4gPiAgICAgICBOb3RlIHRoYXQg
dGhlIGFyY2ggc3BlY2lmaWMgdmFyaWFudHMgYXJlIGFsd2F5cyBwcmVmZXJyZWQgd2hlbgo+ID4g
ICAgICAgYXZhaWxhYmxlLgo+ID4KPiA+ICAgIDQuIEhBUkRMT0NLVVBfREVURUNUT1JfUEVSRi9C
VUREWSB2YXJpYWJsZXMgZGVmaW5lIHdoZXRoZXIgdGhlIGdpdmVuCj4gPiAgICAgICBkZXRlY3Rv
ciBpcyBlbmFibGVkIGluIHRoZSBlbmQuCj4gPgo+ID4gICAgNS4gSEFWRV9IQVJETE9DS1VQX0RF
VEVDVE9SX05PTl9BUkNIIGFuZCBIQVJETE9DS1VQX0RFVEVDVE9SX05PTl9BUkNICj4gPiAgICAg
ICBhcmUgdGVtcG9yYXJ5IHZhcmlhYmxlcyB0aGF0IGFyZSBnb2luZyB0byBiZSByZW1vdmVkIGlu
Cj4gPiAgICAgICBhIGZvbGxvd3VwIHBhdGNoLgo+ID4KPiAKPiBJIGRvbid0IHJlYWxseSBoYXZl
IGFueSBzdHJvbmcgb3BpbmlvbnMsIHNvIEknbSBmaW5lIHdpdGggdGhpcy4gSW4KPiBnZW5lcmFs
IEkgdGhpbmsgdGhlIG9yZGVyaW5nIEkgcGlja2VkIHRyaWVkIHRvIG1hdGNoIHRoZSBleGlzdGlu
Zwo+ICJzdHlsZSIgd2hpY2ggZ2VuZXJhbGx5IHRyaWVkIHRvIGxpc3QgY29uZmlncyBhbmQgdGhl
biBzZWxlY3QgdGhlbQo+IGJlbG93LiBUbyBtZSB0aGUgZXhpc3Rpbmcgc3R5bGUgbWFrZXMgbW9y
ZSBzZW5zZSB3aGVuIHRoaW5raW5nIGFib3V0Cj4gd3JpdGluZyBDIGNvZGUKCkkga25vdy4gTXkg
bW90aXZhdGlvbiB3YXMgdGhlIGZvbGxvd2luZzoKCjEuIEtjb25maWcgaXMgbm90IEMuIE15IHZp
ZXcgaXMgdGhhdCBpdCBpcyBtb3JlIGxpa2UgYSBtZW51LiBUaGVyZSBpcyBhCiAgIHRvcCBsZXZl
bCBpdGVtLiBJZiB0aGUgdG9wIGxldmVsIGlzIGVuYWJsZWQgdGhlbiB0aGVyZSBpcyBhIHN1Ym1l
bnUKICAgd2l0aCBhIG1vcmUgZGV0YWlsZWQgc2VsZWN0aW9uIG9mIHZhcmlvdXMgdmFyaWFudHMg
YW5kIG9wdGlvbnMuCgoyLiBUaGUgY3VycmVudCBsb2dpYyBpcyBxdWl0ZSBjb21wbGljYXRlZCBm
cm9tIG15IFBPVi4gQW5kIGl0IHdhcwogICBldmVuIGJlZm9yZSB5b3VyIHBhdGNoc2V0LiBGb3Ig
ZXhhbXBsZSwKICAgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0JVRERZIGlzIGRlZmluZWQgYXM6
CgoJY29uZmlnIEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9CVUREWQoJCWJvb2wKCQlkZXBlbmRz
IG9uIFNNUAoJCWRlZmF1bHQgeQoKICAgT25lIHdvdWxkIGV4cGVjdCB0aGF0IGl0IHdvdWxkIGJl
IGVuYWJsZWQgb24gU01QIHN5c3RlbS4KICAgQnV0IHRoZSBmaW5hbCB2YWx1ZSBkZXBlbmRzIG9u
IG1hbnkgb3RoZXIgdmFyaWFibGVzCiAgIHdoaWNoIGFyZSBkZWZpbmVkIHVzaW5nIHJlbGF0aXZl
bHkgY29tcGxleCBjb25kaXRpb25zLAogICBlc3BlY2lhbGx5IEhBUkRMT0NLVVBfREVURUNUT1Is
IEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9OT05fQVJDSCwKICAgYW5kIEhBUkRMT0NLVVBfREVU
RUNUT1JfTk9OX0FSQ0guCgogICBVbmRlcnN0YW5kaW5nIHRoZSBsb2dpYyBpcyBldmVuIG1vcmUg
Y29tcGxpY2F0ZWQgYmVjYXVzZSBLY29uZmlnIGlzCiAgIG5vdCBpbmRleGVkIGJ5IGNzY29wZS4K
CkltcG9ydGFudDogVGhlIGxvZ2ljIHVzZWQgYXQgdGhlIGVuZCBvZiB0aGUgcGF0Y2hzZXQgYWN0
dWFsbHkKICAgZm9sbG93cyB0aGUgQyBzdHlsZS4gSXQgZGVmaW5lcyBob3cgdGhlIHZhcmlvdXMg
dmFyaWFibGVzCiAgIGRlcGVuZCBvbiBlYWNoIG90aGVyIGZyb20gdG9wIHRvIGJvdHRvbS4KCj4g
Cj4gY29uZmlnIFNPRlRMT0NLVVBfREVURUNUT1I6Cj4gICAuLi4gYmxhaCBibGFoIGJsYWggLi4u
CgpUaGlzIG9uZSBpcyBhY3R1YWxseSBkZWZpbmVkIGluIHRoZSBtZW51LWxpa2Ugb3JkZXI6CgoJ
Y29uZmlnIFNPRlRMT0NLVVBfREVURUNUT1IKCgljb25maWcgQk9PVFBBUkFNX1NPRlRMT0NLVVBf
UEFOSUMKCQlkZXBlbmRzIG9uIFNPRlRMT0NLVVBfREVURUNUT1IKCkl0IGlzIGJlY2F1c2UgdGhl
IGN1c3RvbSBvcHRpb24gZGVwZW5kcyBvbiB0aGUgdG9wIGxldmVsIG9uZS4KVGhpcyBpcyBleGFj
dGx5IHdoYXQgSSB3b3VsZCBsaWtlIHRvIGFjaGlldmUgd2l0aCBIQVJETE9DS1VQCnZhcmlhYmxl
cyBpbiB0aGlzIHBhdGNoc2V0LgoKQmVzdCBSZWdhcmRzLApQZXRyCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBs
aXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
