Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B396BCF3C
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Mar 2023 13:17:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pcmYE-0002w7-Ef
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 16 Mar 2023 12:17:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1pcmY9-0002vY-I0
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 16 Mar 2023 12:17:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PG48nGt283h3i3ivVwBFexlHE8X9tEw8yZlYxndxZ40=; b=ihtBudKDWt/zZ8eDO05oATBGou
 tM1fongpD3i1i6QG5OyhMmsitzK7qSQi90bLtzb2/rldqMFnwJrgMur8+FdIvJvg+ydOWFLFDL01l
 piLnCL722hd+QDqPCPpEuUe7YQEJbWXY14k4dR2+tZuZ9VnIFQF/wrWUX8sSug/RnS88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PG48nGt283h3i3ivVwBFexlHE8X9tEw8yZlYxndxZ40=; b=aF+ZPd+Qyhsu70TwqPnbk9X7aj
 GidIxQns0dRLCSrZQDvlfIVOERZY62SWebflZ5Ikluu6wciaClWWb9tP1v4By6bb8CvhaMqYeV8rK
 qP/Xd4iWo2E8gH/P76M5jNB31ZMJJP313OpqcuybKdXZl/CNp1Pwx+E7kOZkMEley0FY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pcmY6-0007jE-6j for kgdb-bugreport@lists.sourceforge.net;
 Thu, 16 Mar 2023 12:17:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8506162006;
 Thu, 16 Mar 2023 11:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C72BC433D2;
 Thu, 16 Mar 2023 11:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1678967952;
 bh=JTnjYbj66aN40aUIHsnXpnQOvlOwhzGAN41UkEtNOfs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d5x4qxlnXN/FxScIYVQLl3wY7G+sY6nohkE9R9DKJKUci9iLi5ng3MakWJHStU+OO
 Rd3z/9l/qUvHUFRQRt1/DEmkpF4TpXq6eU7DuS6bxc3JxWEU/VvyZ/LhiVyZ4QrPmQ
 yME36sVYK8hNymm5mq5MWaoFzj6DbTXaKYpJY+bo=
Date: Thu, 16 Mar 2023 12:59:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZBMEjp16fBNE33o4@kroah.com>
References: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
 <20230307073155.2.I106c39498d8094c6f5e7ada42c7db17aa5c64e48@changeid>
 <CAD=FV=XFEYPbC64TFLVUmky=1Y-b_iyqiwrALvjKTM_NWr34Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=XFEYPbC64TFLVUmky=1Y-b_iyqiwrALvjKTM_NWr34Dg@mail.gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Mar 13, 2023 at 01:53:02PM -0700, Doug Anderson wrote:
    > Hi, > > On Tue, Mar 7, 2023 at 7:32 AM Douglas Anderson <dianders@chromium.org>
    wrote: > > > > On Qualcomm devices which use the "gen [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pcmY6-0007jE-6j
Subject: Re: [Kgdb-bugreport] [PATCH 2/3] serial: uart_poll_init() should
 power on the UART
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-serial@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gTW9uLCBNYXIgMTMsIDIwMjMgYXQgMDE6NTM6MDJQTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPiAKPiBPbiBUdWUsIE1hciA3LCAyMDIzIGF0IDc6MzLigK9BTSBEb3VnbGFz
IEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFF1YWxj
b21tIGRldmljZXMgd2hpY2ggdXNlIHRoZSAiZ2VuaSIgc2VyaWFsIGRyaXZlciwga2RiL2tnZGIg
d29uJ3QKPiA+IGJlIHZlcnkgaGFwcHkgaWYgeW91IHVzZSBpdCBidXQgdGhlIHJlc291cmNlcyBv
ZiB0aGUgcG9ydCBoYXZlbid0IGJlZW4KPiA+IHBvd2VyZWQgb24uIFRvZGF5IGtkYi9rZ2RiIHJl
bHkgb24gc29tZW9uZSBlbHNlIHBvd2VyaW5nIHRoZSBwb3J0Cj4gPiBvbi4gVGhpcyBjb3VsZCBi
ZSB0aGUgbm9ybWFsIGtlcm5lbCBjb25zb2xlIG9yIGFuIGFnZXR0eSBydW5uaW5nLgo+ID4gTGV0
J3MgZml4IHRoaXMgdG8gZXhwbGljaXRseSBwb3dlciB0aGluZ3Mgb24gd2hlbiBzZXR0aW5nIHVw
IGEgcG9sbGluZwo+ID4gZHJpdmVyLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5k
ZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPiA+IC0tLQo+ID4KPiA+ICBkcml2ZXJzL3R0
eS9zZXJpYWwvc2VyaWFsX2NvcmUuYyB8IDYgKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQo+IAo+IEp1c3QgaW4gY2FzZSBpdCdzIG5vdCBvYnZpb3VzLCBldmVuIHRo
b3VnaCB3ZSBlbmRlZCB1cCBnb2luZyB3aXRoCj4gSm9oYW4ncyBzZXJpZXMgWzFdIGluc3RlYWQg
b2YgcGF0Y2ggIzEgb2YgbXkgc2VyaWVzLCBwYXRjaCAjMiBhbmQgIzMKPiBvZiBteSBzZXJpZXMg
YXJlIHN0aWxsIHJlbGV2YW50LiBJIGNhbiByZXBvc3QgdGhlIHNlcmllcyB3aXRob3V0IHBhdGNo
Cj4gIzEgaWYgaXQncyBoZWxwZnVsLgo+IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjMwMzA3MTY0NDA1LjE0MjE4LTEtam9oYW4rbGluYXJvQGtlcm5lbC5vcmcKClllLHMgaXQn
cyBub3Qgb2J2aW91cyBhdCBhbGwuICBQbGVhc2UgcmVzdWJtaXQuCgp0aGFua3MsCgpncmVnIGst
aAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGIt
YnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdy
ZXBvcnQK
