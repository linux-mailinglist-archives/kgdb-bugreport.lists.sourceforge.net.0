Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 534D689EA40
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 10 Apr 2024 08:00:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ruR07-0003qs-WF
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 10 Apr 2024 06:00:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1ruR06-0003qi-9W
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 06:00:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4nceE9dzh6agruZ0ClVf+fED5Qi9Ohw9OChjlhmj8TM=; b=ZBsAxL0wOCh497Us7dnVqxjYAa
 C4Ep28Ye6adhQH4rPUXvXnt3tt1KR70P0k85EWkWgom9GPD3yrcHhxIc+FchxkHsyReyn13GKuWx9
 Xl/j3+8LP1MzpPQhrUl4nF/i9C+xt6eS7zTLnHGcGnZnnHlG+2vWsSWJKvVyDqOpKnzU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4nceE9dzh6agruZ0ClVf+fED5Qi9Ohw9OChjlhmj8TM=; b=Z6ESFZZllMegSxh9pfXgKkw9G1
 JwYE//w+u4L4PoJvcj60t3+pc346ibPaWUtTglhRV7bBo66yxIYNczuzfpTltHgWULtIlIQSEQJXX
 UQ8muyZy/4nQH/Yk6ZLn2fIzI6aE9rIUKLFfaPAya04SjbzA8o9I6z1+41rdOWLyKUjE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruQzq-00005Z-T8 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 06:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B3BDC61A2F;
 Wed, 10 Apr 2024 05:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D509BC433C7;
 Wed, 10 Apr 2024 05:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1712728776;
 bh=ukxMVPAJ/AkosAmnVzWG0as7OY6SvL0J05596JAPvK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nYKgVMAMlBfHB848hHBR7S+eB8r3weqJvCRq33/TTgMMD93HCsm9//plbMy5w02Yd
 SfNmkOhq+JO6iYOFZfNvAHmz97Tg2feCLTVbibUZrE4zyil3vQCNN61cG+sWMUnhmT
 UETYje6KKLFzTGGbdhaN9wVt5uwdbK59i0S8jiO0=
Date: Wed, 10 Apr 2024 07:59:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Liuye <liu.yeC@h3c.com>
Message-ID: <2024041001-retaliate-cork-1fe5@gregkh>
References: <20240409020326.2125332-1-liu.yec@h3c.com>
 <20240410020615.2885000-1-liu.yec@h3c.com>
 <2024041014-padlock-aggregate-4705@gregkh>
 <0c004dd44ad5478eba9451186f4ec962@h3c.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c004dd44ad5478eba9451186f4ec962@h3c.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 10, 2024 at 05:54:08AM +0000, Liuye wrote: > >>
 Signed-off-by: Greg KH <gregkh@linuxfoundation.org> > > > >I have NOT signed
 off on this commit. You just said that I made a legal statement [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1ruQzq-00005Z-T8
Subject: Re: [Kgdb-bugreport] 
 =?utf-8?b?562U5aSNOiBbUEFUQ0ggVjEwXSBrZGI6IEZp?=
 =?utf-8?q?x_the_deadlock_issue_in_KDB_debugging=2E?=
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

T24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgMDU6NTQ6MDhBTSArMDAwMCwgTGl1eWUgd3JvdGU6Cj4g
Pj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4g
Pgo+ID5JIGhhdmUgTk9UIHNpZ25lZCBvZmYgb24gdGhpcyBjb21taXQuICBZb3UganVzdCBzYWlk
IHRoYXQgSSBtYWRlIGEgbGVnYWwgc3RhdGVtZW50IGFib3V0IHRoaXMgY29tbWl0IHdpdGhvdXQg
dGhhdCBhY3R1YWxseSBiZWluZyB0cnVlPz8/Cj4gPgo+ID5Tb3JyeSwgYnV0IHRoYXQgaXMgZmxh
dCBvdXQgbm90IGFjY2VwdGFibGUgYXQgYWxsLiAgUGxlYXNlIGdvIHdvcmsgd2l0aCB5b3VyIGNv
bXBhbnkgbGF3eWVycyB0byBmaWd1cmUgb3V0IHdoYXQgeW91IGRpZCBhbmQgY29tZSBiYWNrIHdp
dGggYW4gZXhwbGFpbmF0aW9uIG9mIGV4YWN0bHkgd2hhdCB0aGlzIGlzIGFuZCBob3cgaXQgd2ls
bCBub3QgaGFwcGVuIGFnYWluLgo+ID4KPiAKPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZj
aGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+Cj4gPgo+ID4+IFY5IC0+IFYxMCA6IEFk
ZCBTaWduZWQtb2ZmLWJ5IG9mIEdyZWcgS0ggYW5kIEFuZHkgU2hldmNoZW5rbywgQWNrZWQtYnkg
Cj4gPj4gb2YgRGFuaWVsIFRob21wc29uCj4gPgo+ID5IdWg/IQo+IAo+IEBncmVnIGstaCDvvJoK
PiBAQW5keSBTaGV2Y2hlbmtvIO+8mgo+IAo+IFNvcnJ5LCBpdCB3YXMgbXkgbWlzdGFrZS4gSSBt
aXN1bmRlcnN0b29kIHRoZSBtZWFuaW5nIG9mICJzaWduZWQtb2ZmLWJ5Iiwgd2hpY2ggbGVkIHRv
IHVzYWdlIGlzc3Vlcy4KPiAKPiBJIHdhbnQgdG8gZXhwcmVzcyBteSBncmF0aXR1ZGUgZm9yIHRo
ZSBzdWdnZXN0aW9ucyBvbiB0aGUgcGF0Y2ggZnJvbSB0aGUgdHdvIG9mIHlvdS4gCj4gCj4gV2hh
dCBkbyBJIG5lZWQgdG8gZG8gbm93PyBSZWxlYXNlIFBBVENIIFYxMSBhbmQgZGVsZXRlIHRoZXNl
IHR3byBzaWduYXR1cmVzIGluIGl0ID8KCkFzIEkgc2FpZCwgZ28gd29yayB3aXRoIHlvdXIgY29y
cG9yYXRlIGxhd3llcnMgb24gdGhpcyB0byB1bmRlcnN0YW5kCndoYXQganVzdCBoYXBwZW5lZCBh
bmQgaGF2ZSB0aGVtIGxldCB1cyBrbm93IGhvdyBpdCB3aWxsIG5vdCBoYXBwZW4KYWdhaW4uCgp0
aGFua3MsCgpncmVnIGstaAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8va2dkYi1idWdyZXBvcnQK
