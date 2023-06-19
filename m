Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA31B7350F5
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 19 Jun 2023 11:55:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qBBbU-0002br-LD
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 19 Jun 2023 09:55:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1qBBbS-0002bX-7A
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 19 Jun 2023 09:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BqmUWIwDB6MccYaGRsbpmDX+MgysrUEAbIREmqAE7tY=; b=TiUqCxzRP7vxASxC8YevZrin/a
 bLEKZh7clYXluZ+fBfjZYx9SNmGZLHGf8vlao+lMxotQMAgDrotDs9bCWv4hQjRISuHjHOhUTBBwW
 3Zkaq2+zPvRciTqWgzFbBt8ZZo7nY6Jgu2F7It4w19TCrLnrbRhwIBQB97YnfRqQvbO0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BqmUWIwDB6MccYaGRsbpmDX+MgysrUEAbIREmqAE7tY=; b=cWBGnau+1yX7MRXgmS+v4J4Lcg
 a2zilXNxaxgF6W96Nwkzq5tkiMCYye5FXEGS5StDYUa0Pso+pLuF5lU227k2HipLnWGO1Uo4ub/nA
 eUA1/4FLtPXRSXZe5f2R598qu8vkika8CYQ2c3PhwXgOU9ou+cyGAglln/DqSkrefmjE=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qBBbO-0005Jv-Oc for kgdb-bugreport@lists.sourceforge.net;
 Mon, 19 Jun 2023 09:55:17 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 680A91F38A;
 Mon, 19 Jun 2023 09:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1687168508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BqmUWIwDB6MccYaGRsbpmDX+MgysrUEAbIREmqAE7tY=;
 b=kpNSnf7reRG026G37InlC9KBsz3JngC4BSohPCpE0Ofc8ydoyz5aDha+1hAEwNWXhASmzX
 JV7x4Bu/lZZHnRlKAzxfLi3A7L5vetPl1KZBY3/H/ktCk4Lt0ZiiylFlNJrfUgRwyPoKfP
 BcAm8JrzmAlSyJ7pzGIK0PKATklgyIU=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A3CCF2C141;
 Mon, 19 Jun 2023 09:55:06 +0000 (UTC)
Date: Mon, 19 Jun 2023 11:55:06 +0200
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZJAl-rznBaZubY3-@alley>
References: <20230616150618.6073-1-pmladek@suse.com>
 <20230616150618.6073-5-pmladek@suse.com>
 <CAD=FV=U=ox4ApMbDL7v=ivNF6x=UyG=dd4MU_Dt0rppNCEwCpw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=U=ox4ApMbDL7v=ivNF6x=UyG=dd4MU_Dt0rppNCEwCpw@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri 2023-06-16 09:48:06, Doug Anderson wrote: > Hi, > >
    On Fri, Jun 16, 2023 at 8:07 AM Petr Mladek <pmladek@suse.com> wrote: >
    > > > There are several hardlockup detector implementations and sev [...]
    
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qBBbO-0005Jv-Oc
Subject: Re: [Kgdb-bugreport] [PATCH v2 4/6] watchdog/hardlockup: Make
 HAVE_NMI_WATCHDOG sparc64-specific
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

T24gRnJpIDIwMjMtMDYtMTYgMDk6NDg6MDYsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gSGksCj4g
Cj4gT24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgODowN+KAr0FNIFBldHIgTWxhZGVrIDxwbWxhZGVr
QHN1c2UuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGVyZSBhcmUgc2V2ZXJhbCBoYXJkbG9ja3VwIGRl
dGVjdG9yIGltcGxlbWVudGF0aW9ucyBhbmQgc2V2ZXJhbCBLY29uZmlnCj4gPiB2YWx1ZXMgd2hp
Y2ggYWxsb3cgc2VsZWN0aW9uIGFuZCBidWlsZCBvZiB0aGUgcHJlZmVycmVkIG9uZS4KWy4uLl0K
PiA+IE5vdGUgdGhhdCBIQVJETE9DS1VQX0RFVEVDVE9SX1BSRUZFUl9CVUREWSwgSEFSRExPQ0tV
UF9ERVRFQ1RPUl9QRVJGLAo+ID4gYW5kIEhBUkRMT0NLVVBfREVURUNUT1JfQlVERFkgbWF5IGNv
bmZsaWN0IG9ubHkgd2l0aAo+ID4gSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0guIFRoZXkg
ZGVwZW5kIG9uIEhBUkRMT0NLVVBfREVURUNUT1IKPiA+IGFuZCBpdCBpcyBub3QgbG9uZ2VyIGVu
YWJsZWQgd2hlbiBIQVZFX05NSV9XQVRDSERPRyBpcyBzZXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogUGV0ciBNbGFkZWsgPHBtbGFkZWtAc3VzZS5jb20+Cj4gPgo+ID4gd2F0Y2hkb2cvc3BhcmM2
NDogUmVuYW1lIEhBVkVfTk1JX1dBVENIRE9HIHRvIEhBVkVfSEFSRExPQ0tVUF9XQVRDSERPR19T
UEFSQzY0ClsuLi5dCj4gPiBBbHNvIHRoZSB2YXJpYWJsZSBpcyBzZXQgb25seSBvbiBzcGFyYzY0
LiBNb3ZlIHRoZSBkZWZpbml0aW9uCj4gPiBmcm9tIGFyY2gvS2NvbmZpZyB0byBhcmNoL3NwYXJj
L0tjb25maWcuZGVidWcuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ciBNbGFkZWsgPHBtbGFk
ZWtAc3VzZS5jb20+Cj4gCj4gSSB0aGluayB5b3UgZ29vZmVkIHVwIHdoZW4gc3F1YXNoaW5nIHRo
ZSBwYXRjaGVzLiBZb3UndmUgbm93IGdvdCBhCj4gc2Vjb25kIHBhdGNoIHN1YmplY3QgYWZ0ZXIg
eW91ciBmaXJzdCBTaWduZWQtb2ZmLWJ5IGFuZCB0aGVuIGEgc2Vjb25kCj4gU2lnbmVkLW9mZi1i
eS4uLiBJIGFzc3VtZSBldmVyeXRoaW5nIGFmdGVyIHRoZSBmaXJzdCBTaWduZWQtb2ZmLWJ5Cj4g
c2hvdWxkIGJlIGRyb3BwZWQ/CgpBaCwgeW91IGFyZSByaWdodC4gSXQgc2VlbXMgdGhhdCBBbmRy
ZXcgaGFzIGZpeGVkIHRoaXMgd2hlbiB0YWtpbmcKdGhlIHBhdGNoLgoKVGhhbmsgeW91IGJvdGgs
ClBldHIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpL
Z2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGIt
YnVncmVwb3J0Cg==
