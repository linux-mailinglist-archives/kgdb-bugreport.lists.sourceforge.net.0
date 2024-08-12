Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A281C94F8BE
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Aug 2024 23:07:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sdcG6-0001dd-Ed
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 12 Aug 2024 21:07:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sdcG5-0001dX-3z
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Aug 2024 21:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RmvIt3Q3hRp07dfKBkbkpBI1nxzWKnrXiTKUARXGJck=; b=TRtbNHZr+lHnf+U5YxopTgdmpE
 M9jiGCjLbERWeXnMAqSTjrQ4jL9G3Nna33PMgl7kUdlrc/c4ZSbXDTFLbEjY0NnWXSG3ZE1o6llJq
 jGsbTJ7KsWb5QZlvD6gJ5jwWP6WQHL5DZO/p6RyXxAnqs1enQdGVDKV06P0bIkM5Qiaw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RmvIt3Q3hRp07dfKBkbkpBI1nxzWKnrXiTKUARXGJck=; b=ILb5AL7HKqQQUc1lqBKWOoutrU
 uHVucKmv7wyuV2G1ZVlbfuS2HTgadTvm4VB/80U2Ohwkq6klhpP24GCT4+fPWcYWQoD7CNrC5wVT4
 4hlD8RfYNti7+7raUIzyZM9AnjNlXkMg4j0stzBCgn/TrqioD76AYbZCKfp81iKmty14=;
Received: from mail-qt1-f177.google.com ([209.85.160.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sdcG4-0005F2-F6 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Aug 2024 21:07:17 +0000
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-450059a25b9so5025541cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Aug 2024 14:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723496825; x=1724101625;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RmvIt3Q3hRp07dfKBkbkpBI1nxzWKnrXiTKUARXGJck=;
 b=gwbrXwevKuibQl6I7/O6vJMMongYCOyMy8bJYUIhRwKw6JQbZE49K9uzCFHJaKN/AT
 /Z42Y+i/4EahMHENgOE3fqtZriZNgbegX4qehgx+P8jS0E1VZQ6xTFpyufmk8ja8JDOY
 NYE1idgNfTw5G9oEX86MhbT1II81/ek/mbAUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723496825; x=1724101625;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RmvIt3Q3hRp07dfKBkbkpBI1nxzWKnrXiTKUARXGJck=;
 b=Wsnp26FNDvwgHKvkD9Tk3tf3TGtdQ5HLVdxEa6MAYRIyG/TDqoG5TCvLkbjIc/wQIH
 aMPoVaWhP2REUYMzoDJn/OTe7nXF2dXY6GOIp1MyViNoS5wkiKOTbI5XpZ8Zbzr+oJOw
 4igeTAKmbrRTuE1elrK7/aqzA1Jlbtk970zSVl4NPl0DW5u2MzxhcXoLfoBR/pd3cvaN
 iiRqu0VCQFMlsRZr+5H+3xmHMvCrxGoGCGNvTODmfqzteqZmGYgbyvcq/o04cwXkLAq5
 bqzzIUs6vBxerpkXT70enA+juRSvP5hwyiAgGcrkIDGbSV09921F9iareQaWopRCJ9dN
 7wlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9ZNd+AdCFu1tdA+g6iL964TR/RFRqV/15NitOz60ejkMtuZjdjCH6wvTDGa7CJ6PNOCYBZmMwnuEflsX6rnwic3gMJ4OXOAn+wgYJjiCWWMqVrOs=
X-Gm-Message-State: AOJu0Ywp6wlCfZr1v/zHNH0ga/i6Viubjn683rpuO4jNfckpMgP81uK0
 B7rDQkafgGxMbvaaDCKY3GE8z4bfDPzFXmXijLn3cdi28RFi04XNveby8cVCybpyEOdepjPbEnQ
 =
X-Google-Smtp-Source: AGHT+IHTGsB89W4hRxRjupPyTZ8ZLwNfAoTYvtiZvOXBu9h/qBBCgmi4hMTI9ZimTdBUjApUpi6I+Q==
X-Received: by 2002:a05:6214:4519:b0:6bb:b18c:f67a with SMTP id
 6a1803df08f44-6bf50c3f2eemr15037876d6.26.1723493078234; 
 Mon, 12 Aug 2024 13:04:38 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com.
 [209.85.219.41]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bd82e35785sm27634496d6.81.2024.08.12.13.04.37
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 13:04:37 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6bbbd25d216so43932626d6.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Aug 2024 13:04:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX3mf1M0xPrDXVTCCXuIU5+zp3DhhB/5QS0RqBfucd/v6uBbVh0UQlTUp26iC5Pbxhn3FcyzT99JdCCUycsVyeNlYsEnNFnWbtAekUVKtCoi71EfxE=
X-Received: by 2002:a05:6214:1c83:b0:6b5:e761:73ce with SMTP id
 6a1803df08f44-6bf50c08da9mr13788676d6.16.1723493076757; Mon, 12 Aug 2024
 13:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240812085459.291741-1-mail@florommel.de>
In-Reply-To: <20240812085459.291741-1-mail@florommel.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Aug 2024 13:04:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VC20PvOPSf9quqghA8SKKkCduadtU7nso4wkSwVKH3jQ@mail.gmail.com>
Message-ID: <CAD=FV=VC20PvOPSf9quqghA8SKKkCduadtU7nso4wkSwVKH3jQ@mail.gmail.com>
To: Florian Rommel <mail@florommel.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Aug 12, 2024 at 1:55 AM Florian Rommel <mail@florommel.de>
    wrote: > > The test for access watchpoints (hw_access_break_test) was broken
    > (always failed) because the compiler optimized out t [...] 
 
 Content analysis details:   (-0.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.160.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sdcG4-0005F2-F6
Subject: Re: [Kgdb-bugreport] [PATCH] kgdbts: fix hw_access_break_test
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIEF1ZyAxMiwgMjAyNCBhdCAxOjU14oCvQU0gRmxvcmlhbiBSb21tZWwgPG1h
aWxAZmxvcm9tbWVsLmRlPiB3cm90ZToKPgo+IFRoZSB0ZXN0IGZvciBhY2Nlc3Mgd2F0Y2hwb2lu
dHMgKGh3X2FjY2Vzc19icmVha190ZXN0KSB3YXMgYnJva2VuCj4gKGFsd2F5cyBmYWlsZWQpIGJl
Y2F1c2UgdGhlIGNvbXBpbGVyIG9wdGltaXplZCBvdXQgdGhlIHdyaXRlIHRvIHRoZQo+IHN0YXRp
YyBoZWxwZXIgdmFyaWFibGUgKGh3X2JyZWFrX3ZhbDIpLCBhcyBpdCBpcyBuZXZlciByZWFkIGFu
eXdoZXJlLgo+IFRoaXMgcmVzdWx0ZWQgaW4gdGhlIHRhcmdldCB2YXJpYWJsZSAoaHdfYnJlYWtf
dmFsKSBub3QgYmVpbmcgYWNjZXNzZWQKPiBhbmQgdGh1cyB0aGUgYnJlYWtwb2ludCBub3QgYmVp
bmcgdHJpZ2dlcmVkLgo+Cj4gUmVtb3ZlIHRoZSBoZWxwZXIgdmFyaWFibGUgKGh3X2JyZWFrX3Zh
bDIpLCBhbmQgdXNlIFJFQURfT05DRSB0byBmb3JjZQo+IHJlYWRpbmcgdGhlIHRhcmdldCB2YXJp
YWJsZSAoaHdfYnJlYWtfdmFsKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEZsb3JpYW4gUm9tbWVsIDxt
YWlsQGZsb3JvbW1lbC5kZT4KPiAtLS0KPiAgZHJpdmVycy9taXNjL2tnZGJ0cy5jIHwgNCArKy0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpSZXZp
ZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0
IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
