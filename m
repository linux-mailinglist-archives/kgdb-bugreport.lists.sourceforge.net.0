Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A6D65BE5C
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  3 Jan 2023 11:46:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pCeoe-0008HQ-V0
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 03 Jan 2023 10:46:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <deller@gmx.de>) id 1p8PQu-0004dH-QC
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 22 Dec 2022 17:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sonf3YuJ21g7y9fP2klqVc6ahItTRyNJlBOds7p9XJg=; b=JNbbX+gOXSQgGb7EbwaFSyAxm7
 uf+/ypY4upoqjCU1FamSj1tYl0l1qcD/Nrs2HS6EBjMpWaOaIrOL/ZwNpe90QRMsBO/KKlVbjFDdr
 V451I1vFgPwuaEZf5LJrhw4QKqt1sSoTJ3Wf42UVlLyN9YNAR+xABO/+twN/6pA2lPGI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sonf3YuJ21g7y9fP2klqVc6ahItTRyNJlBOds7p9XJg=; b=m2/QNOLXx96qhWWWK810YUa5/A
 RRr0nVQYdiCUk5wlZ6A/AD0YP48P6p3d0pKIKPwyhYtSAIYnSvXPiU/KUw3JPsBVbDtZ/FsO1jVbt
 g5x6LdLoRVWClPCVQi5zE7EYVtb07QKby4jsdM/MxaEJu6eZqleJ+lnU7QO3fe4A7p6Q=;
Received: from mout.gmx.net ([212.227.15.18])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p8PQt-007wik-OL for kgdb-bugreport@lists.sourceforge.net;
 Thu, 22 Dec 2022 17:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671730345; bh=joTnMx5Wltrn22nCgRqZ2lqm+qJj8yI9pYNBu2qONEA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=l4uNxKBuEYw92uOKJZZ2jESgR7nQiz0SFCHaV7DmugSvEOGeEP2jv6Us+RwrgOgis
 1zVtzwTzjTL3NzjxsmQGiawFj1+DNJ5bqi33VQ6jxxeZYiACpOOBATV/RqsfJ7uFj9
 x+fpNNLU8pfqBE6W3Of4WmdKwUDAkk2bntcOMsscCZ3MlfDpWmWk8P2r+qqCcwAJf6
 /cR9b7EtZq4f70imXVnRes2QGJxyEck7Kjek3bn3DC1Dm/lAtFrT6/sG+inX9tOp5b
 Gcwa04Re4niz56g9rKF6kuJN95rFa+i6o/IUujgl8sQlFMVH3Y11fU15in9QJSj0Gd
 2pxRsLCM3Gy0A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.142.238]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKGZ-1p6VkG2Dw9-00FoG1; Thu, 22
 Dec 2022 18:32:25 +0100
Message-ID: <b49b8c19-5dc1-5cc2-2c92-711456a56ea1@gmx.de>
Date: Thu, 22 Dec 2022 18:32:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <Y6DhewN27vMnfgzT@p100> <Y6SKpn1Zaz9aZN1Y@aspen.lan>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <Y6SKpn1Zaz9aZN1Y@aspen.lan>
X-Provags-ID: V03:K1:v3AjLOx2gTzyQ63WCKomL2foOtbTXdiI35v+wb8O1mFgCNVBNbV
 I5JrgsLnsuFPTAOTyK0MWKx1IsoGlVDwUkwKrpIxLcqC5qQaCqoNasFgV4sal1p08JIGAOx
 mOXOvHNnxYV57ivityTUsPAFrx05yQkcXVsW4TyPOgDHY7IMsTRt81LaJ41BoTdrywzK/Pm
 W38q+G2xKxVL9+5Oio5jA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bRnqSWadAjs=;6zpaXwGIdypNdnzehnebSkSDZJc
 F92NOpDGqtVH+KfGhc25EmaIT0Sh5njJhAmHrAYzqvCZM3PvqSh0LYsNpl94s/UcZ0KAQzl42
 t1p67SoR2V+Z45Z1bam1N+2iVPTNasPMs8rsubDC6d1fKp91NSoWUeGaINsFTJd+2UR2hgahB
 n+tZ/JTTW8DLd725oVl9cfcBwO8uwiEZroYhrbEgdiCKbk5MYwMeUQkjhRyS8sQ6B6sk5SVke
 tBt8WBHE+SMH1NVSGpkAD+mUZu+ukF232HjItM30NCNXe1eslV/kgYbhzpuwqcZoUh3UVCbns
 p2EWL1uRffU88jsmZEqii0k7Uv92Lkd49NDtRwTlI3sxPLU2u5qtRFTLFV+YCQF4LNB5xdOKO
 X7JEqHj2H+teJK4YmG/X1JE2BRzMH15KU3HQruoQEzvqV9f0VHgSwSLiSey9DpwCS9AjZk/9D
 OBMh9ljiOKRsnQNMJ8kvy+DDJ/uoCuLw3xi9jVt3dX6hTCAOOGs58+ZufkjInvv4Z0GJutlOc
 TQS9+l1XnFuYD3UGKQA3R8yNnEoypxx8AlRYseHmai/I+2l3kXGuDgcIEIIFg4WlryJQtIqH5
 vHVhrxFz8vexLmTZMTKics4SxskRegrPFNsHTSj33VBYg5SoyDEeq+9szAKDrHIKBUHawBZWa
 OopfSVP5UqUxcvff3eaI5/+Zh1kCXtd7F2DDTrRR28XL4+lmwzjO8C7o0JItA0QmCAKK39fQk
 0d1wSzXPZzN0I8raIK++7eEz+s96AYjocNQtv6slITmSWvxY5zg+fYFClTT5gc6l1dnfMcfD4
 VWEbwFwsYYHiDlJBbN2gquxERXQGW4uctIyL4yb7oSvP0s5yepXjR84gR0Pa3z3B5UrB5oy8g
 kyCjJ+QhDYY5sH8o9zOIH09uQQk1kUYJta8QrkW5GFU5r4q/I7LpIkAfjLwu7taf6DpFdZGOK
 Tye3Syprs4MMkht+ydRlncy+rxs=
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/22/22 17:49, Daniel Thompson wrote: > On Mon, Dec 19, 
 2022 at 11:11:07PM +0100, Helge Deller wrote: >> On my 32-bit machine, with
 BREAK_INSTR_SIZE=4 the kgdb_break[] structure >> allocates 16000 [...] 
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [212.227.15.18 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [212.227.15.18 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [deller[at]gmx.de]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1p8PQt-007wik-OL
X-Mailman-Approved-At: Tue, 03 Jan 2023 10:46:44 +0000
Subject: Re: [Kgdb-bugreport] [PATCH] Reduce number of concurrent
 KGDB_MAX_BREAKPOINTS
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 12/22/22 17:49, Daniel Thompson wrote:
> On Mon, Dec 19, 2022 at 11:11:07PM +0100, Helge Deller wrote:
>> On my 32-bit machine, with BREAK_INSTR_SIZE=4 the kgdb_break[] structure
>> allocates 16000 bytes of static kernel memory, which is - by default -
>> to be able to handle up to 1000 concurrent kgdb breakpoints.  I might be
>> wrong, but I doubt that in real life someone really needs that many
>> breakpoints, so I suggest to reduce the number of possible kgdb
>> breakpoints and thus reduce the memory footprint of kgdb_break[].
>
> I am somewhat dubious about this change. 1000 is large but if we place
> a breakpoint on an inline function this can result in many breakpoints
> being set (they appear as a single b.p. in the gdb UI but kgdb will see
> all the inlined sites).
>
> As such I'm not clear why 40 (which risks breaking some use cases) is a
> better default than 1000 (which "only" costs us 16 to 24k).
>
> If somebody really wants to debug a system where the memory costs cause
> serious trouble then I guess we could entertain a config option
> (defaulting to 1000) to allow for such tiny systems. However it does
> need to start from "we really need this memory because..." rather than
> just because "16k is a waste".

Saving memory is good, and choosing a sane and realistic high-enough default
value which keeps debugging possible should be the goal. I haven't debugged
much with kgdb yet, so I don't know what the best amount is.
40 was just a guess from me.

Helge


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
