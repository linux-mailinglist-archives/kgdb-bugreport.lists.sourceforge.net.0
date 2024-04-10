Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C953889EA95
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 10 Apr 2024 08:15:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ruRFA-0002OJ-Sj
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 10 Apr 2024 06:15:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1ruRF8-0002Nx-SY
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 06:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=60NiU3K02J1N7CUhOEslqac7//p+Ft60g5Lbr/RsSjA=; b=kP0uFVO2/SQS7FefeHUhy3L8j7
 qg8lseDkWQ2jjQB9ZS7EnXECDdzAWq/drdABjFBzfA1jUKL95tQTggrToTwroH+hlTNLxBngCZuQU
 Geyrt58dpkYggJLLWfPRqTyE1WxEO/PbMKvLegdm9sIywKwROKYoZ1N4NdYVQQSkaaG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=60NiU3K02J1N7CUhOEslqac7//p+Ft60g5Lbr/RsSjA=; b=SjlAFktD4pMMs5cQ5liw7ScsVn
 pMIGTTDvsIpWqOgycH47QmvM+5RPOYhfUIfQXrgBC2Vu+BOjlytgMLXSNtGO/wkyrF6b4qakiVTap
 DIksSZCQqqzlhBkTkwpq29y7GsCQeU7GIzMBrqdiaGURzdLdrKdxveTy6VcJ9DHZiuPw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruREu-0001Cx-7F for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 06:15:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D5B561651;
 Wed, 10 Apr 2024 06:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D73C433F1;
 Wed, 10 Apr 2024 06:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1712729709;
 bh=i1SI/KN3r0p/TBOv27r40IHabpQWrtHclXTYWM4E3BM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2qyXSC6McdQ9greAT8ipTCHr/xjY5kNOSrkhCcTAB0tO8Iu+MCPnF8Xme6UFJzkFb
 qE+lhgiFkbOj2fMQzIFAcwuUj1piXYWnm624l37L0x5PUN6sh2Dgm0REQRWkvedtot
 yOvaw/gT7LNBgG0nS0SE30A5vm8DM1ORmJXFxMlg=
Date: Wed, 10 Apr 2024 08:15:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Liuye <liu.yeC@h3c.com>
Message-ID: <2024041022-electable-unblock-5077@gregkh>
References: <20240409020326.2125332-1-liu.yec@h3c.com>
 <20240410020615.2885000-1-liu.yec@h3c.com>
 <2024041014-padlock-aggregate-4705@gregkh>
 <0c004dd44ad5478eba9451186f4ec962@h3c.com>
 <2024041001-retaliate-cork-1fe5@gregkh>
 <5c659d5f41ff4cf69ea9467b62d74e9b@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c659d5f41ff4cf69ea9467b62d74e9b@h3c.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 10, 2024 at 06:10:10AM +0000, Liuye wrote: > >On
 Wed, Apr 10, 2024 at 05:54:08AM +0000, Liuye wrote: > >> >> Signed-off-by:
 Greg KH <gregkh@linuxfoundation.org> > >> > > >> >I have NOT sig [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1ruREu-0001Cx-7F
Subject: Re: [Kgdb-bugreport] 
 =?utf-8?b?562U5aSNOiDnrZTlpI06IFtQQVRDSCBWMTBd?=
 =?utf-8?q?_kdb=3A_Fix_the_deadlock_issue_in_KDB_debugging=2E?=
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
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgMDY6MTA6MTBBTSArMDAwMCwgTGl1eWUgd3JvdGU6Cj4g
Pk9uIFdlZCwgQXByIDEwLCAyMDI0IGF0IDA1OjU0OjA4QU0gKzAwMDAsIExpdXllIHdyb3RlOgo+
ID4+ID4+IFNpZ25lZC1vZmYtYnk6IEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3Jn
Pgo+ID4+ID4KPiA+PiA+SSBoYXZlIE5PVCBzaWduZWQgb2ZmIG9uIHRoaXMgY29tbWl0LiAgWW91
IGp1c3Qgc2FpZCB0aGF0IEkgbWFkZSBhIGxlZ2FsIHN0YXRlbWVudCBhYm91dCB0aGlzIGNvbW1p
dCB3aXRob3V0IHRoYXQgYWN0dWFsbHkgYmVpbmcgdHJ1ZT8/Pwo+ID4+ID4KPiA+PiA+U29ycnks
IGJ1dCB0aGF0IGlzIGZsYXQgb3V0IG5vdCBhY2NlcHRhYmxlIGF0IGFsbC4gIFBsZWFzZSBnbyB3
b3JrIHdpdGggeW91ciBjb21wYW55IGxhd3llcnMgdG8gZmlndXJlIG91dCB3aGF0IHlvdSBkaWQg
YW5kIGNvbWUgYmFjayB3aXRoIGFuIGV4cGxhaW5hdGlvbiBvZiBleGFjdGx5IHdoYXQgdGhpcyBp
cyBhbmQgaG93IGl0IHdpbGwgbm90IGhhcHBlbiBhZ2Fpbi4KPiA+PiA+Cj4gPj4gCj4gPj4gPj4g
U2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29t
Pgo+ID4+ID4KPiA+PiA+PiBWOSAtPiBWMTAgOiBBZGQgU2lnbmVkLW9mZi1ieSBvZiBHcmVnIEtI
IGFuZCBBbmR5IFNoZXZjaGVua28sIAo+ID4+ID4+IEFja2VkLWJ5IG9mIERhbmllbCBUaG9tcHNv
bgo+ID4+ID4KPiA+PiA+SHVoPyEKPiA+PiAKPiA+PiBAZ3JlZyBrLWgg77yaCj4gPj4gQEFuZHkg
U2hldmNoZW5rbyDvvJoKPiA+PiAKPiA+PiBTb3JyeSwgaXQgd2FzIG15IG1pc3Rha2UuIEkgbWlz
dW5kZXJzdG9vZCB0aGUgbWVhbmluZyBvZiAic2lnbmVkLW9mZi1ieSIsIHdoaWNoIGxlZCB0byB1
c2FnZSBpc3N1ZXMuCj4gPj4gCj4gPj4gSSB3YW50IHRvIGV4cHJlc3MgbXkgZ3JhdGl0dWRlIGZv
ciB0aGUgc3VnZ2VzdGlvbnMgb24gdGhlIHBhdGNoIGZyb20gdGhlIHR3byBvZiB5b3UuIAo+ID4+
IAo+ID4+IFdoYXQgZG8gSSBuZWVkIHRvIGRvIG5vdz8gUmVsZWFzZSBQQVRDSCBWMTEgYW5kIGRl
bGV0ZSB0aGVzZSB0d28gc2lnbmF0dXJlcyBpbiBpdCA/Cj4gPgo+ID5BcyBJIHNhaWQsIGdvIHdv
cmsgd2l0aCB5b3VyIGNvcnBvcmF0ZSBsYXd5ZXJzIG9uIHRoaXMgdG8gdW5kZXJzdGFuZCB3aGF0
IGp1c3QgaGFwcGVuZWQgYW5kIGhhdmUgdGhlbSBsZXQgdXMga25vdyBob3cgaXQgd2lsbCBub3Qg
aGFwcGVuIGFnYWluLgo+IAo+IEknbSB2ZXJ5IHNvcnJ5LCB0aGlzIGlzIG15IGZpcnN0IHRpbWUg
c3VibWl0dGluZyBhIHBhdGNoIGFuZCBJIG1hZGUgYSBzaWduaWZpY2FudCBtaXN0YWtlIGluIHVz
aW5nICJTaWduZWQtb2ZmLWJ5Ii4gSSBub3cgdW5kZXJzdGFuZCB0aGUgbWVhbmluZyBvZiB0aGlz
IGZpZWxkIGFuZCB3aWxsIG5vdCBtYWtlIHRoZSBzYW1lIG1pc3Rha2UgYWdhaW4gaW4gdGhlIGZ1
dHVyZS4KClVuZGVyc3Rvb2QsIGJ1dCB5b3Ugc3RpbGwgbmVlZCB0byBnbyB3b3JrIHdpdGggeW91
ciBjb3Jwb3JhdGUgbGVnYWwKZ3JvdXAgc28gdGhhdCB5b3UgYWxsIGVuc3VyZSB0aGlzIGRvZXMg
bm90IGhhcHBlbiBhZ2FpbiBmb3IgYW55IG90aGVyCmRldmVsb3BlciBpbiB5b3VyIGNvbXBhbnks
IGFzIEkgYW0gc3VyZSB0aGV5IHdpbGwgd2FudCB0byBrbm93IGFib3V0CnRoaXMuCgp0aGFua3Ms
CgpncmVnIGstaAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
a2dkYi1idWdyZXBvcnQK
