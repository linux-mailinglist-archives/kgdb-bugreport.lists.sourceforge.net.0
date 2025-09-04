Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3456DB4428A
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  4 Sep 2025 18:19:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Eeki1a93lwUqo5WyLRkiFSq34pRVaxTmtBtMS5X03E=; b=ZbCFaYh6hSq6sTseeWeb/rH4zs
	kuMPFJyBW5a3ZMprvj0lHoDNG55FTvYFwuFp/h8PNphcH/Hp6C2MfdKj3GCVNoalXnlYHj9EldBEg
	B91w+KnXi1b//8Roc2DkImQFCngtD4C7OLRYSmBBMZT07ojn4iw2YdS3Jumj24rfij5c=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uuCgc-0001gP-Ng
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 Sep 2025 16:19:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1uuCgb-0001gI-MX
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 Sep 2025 16:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SsyMf0YeU+4wG3glWJqroefUkGJSLTFQYT44KukGolg=; b=TcU2taGy7a/S/PXykkJCrFBpIC
 dPwZqD227xsvtGEi5/DaSyvgp3F+8CX6nQCrHFMmVnJhtr0y0vyyBUzvczIYRp/RJ2InP2oXTHvDA
 1PMyJ/dWC624X4ONEAK1U7Pgu6Ne2ZPNDtklPgi9OZdBeqhnirENMNxvFz0mZsLRR3kE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SsyMf0YeU+4wG3glWJqroefUkGJSLTFQYT44KukGolg=; b=RfctVH0uy60yMCeGXhU8ekLeHF
 Kj0Iscd0zPZa4RNIM/pNPyS7TdM5a/i6tVidvdNrDQ9vWtjmjIAbvt+Jc0eSkzGmPTSSGkNyoHGN3
 UKRg2zuy3m7gsVisvcMjWDvgu/HU/zTr7+AA7+IOmBk8zGcO7uSkPdfmD4s2gKWuvmR4=;
Received: from mail-io1-f41.google.com ([209.85.166.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uuCgb-0003Eh-8r for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 Sep 2025 16:19:45 +0000
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-88432ccadeaso122263639f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Sep 2025 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1757002774; x=1757607574;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SsyMf0YeU+4wG3glWJqroefUkGJSLTFQYT44KukGolg=;
 b=bMdclI3/PwBC+NLAJyUJ9tUHtOGCWbWZuFgthFUz5/4zA39D9L9lEnUjz7Bz5ZZMD8
 augI+UgwUTiMzkGalOYvcDhHvxPfm81HO5wNYOEihYIE4pdhHVLp2RFSq9RDHIl2GP2t
 N3FiDC2qybjo1KcWNwPnFDFUkWZjcKbqI2fPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757002774; x=1757607574;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SsyMf0YeU+4wG3glWJqroefUkGJSLTFQYT44KukGolg=;
 b=jOw1psCV7ax/ObAWa2B2evTJuJqL+VU5z+wTfEoOUpJYkutbIwzqb18l5927hvSfDE
 uxsVM6+lnBhM8RfJkc8zdwHHNN1ab2vO77tGApLq2hIPgwNfF+Z2daXWZkdLmTc8dXpH
 w+Ci4P2nqiRhAUa5t0wHnr8ztWdb6zpYAZWV/HVJzRwStmlE7wEVVg19eVndHf5D9UZE
 zVgdfJR3NHCtcEGu+Kbn44Kw9UXDL66y49L81cabogyJMGDBrD2J4xFoiQg6TDLWSWQY
 LPGgTolKgd5bKHUShDGUJoDpHsOux0Wtma+KY8uxoVqRnHNVXn7pWgAjuB4r+AEv+2On
 ORJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfuqzuuno+I2wCLHgESbvgu9loL/fvG1ByYhPX1qrTsj60nnV/fth2kBc1Xq12uPfoASXPwnPhPKT5I/wDPQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YybX1PwplO0yrMwNv33NpeblvOggG+v2T/9jf/ptgPtsxApVhH1
 QOFgb8NLEYdb3GdrWb1jN8P8t1fxnbdKCIPDm+i5Otg/giG2cqHB8+oNt0bGmkp0Yz0aWNA7DjJ
 cW/Y=
X-Gm-Gg: ASbGncsq7ldUlk6HJL9mPBK/3LdUjZylOktgvm7r3wcgn4EqO0bHioe5CyKL2nXEcyR
 TkiWNlL6xI3bOOzgOSr9BDdHabEJKXTV7Tztlcgziv/IxkEjIhZHmUfVDqO9BdsJIqkwWitLko8
 6aqs/xBJNdx7vMiAzQfMBdb4piJo0uJqykfM5h1Ov/OfZ6nw7D4fl+By0hqd92vDnpAW1OoyffI
 2DPx2CYxV56PenO1CTlQZKMCcs5ZKAtQ0i0tSZGscDynmP7XzdXihgTs6YCzsGyYK4Jmdg1sFuF
 jEQMVPpHOqf1CBL7L0tuGkGWF2recoedxE1cXRGN7exby1oanrLmhJD4cfwSFl1+K6PZPUtRGCJ
 JCC3Ng8ywW2Lm/SklzWvoj6n1Xqivfbt/ynZIRCRIBlodqwIPmpM5Aqu7vJQNWAqKgA==
X-Google-Smtp-Source: AGHT+IHCl/lCt7AJHoGmF661xc0iaEkh5oaoR2yITlDkt8H3IzRB+6QJ/lamqT2UaFcvAr+B84t7ow==
X-Received: by 2002:a17:90b:3fd0:b0:32b:623d:ee9e with SMTP id
 98e67ed59e1d1-32b623def99mr8430389a91.14.1757001148861; 
 Thu, 04 Sep 2025 08:52:28 -0700 (PDT)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com.
 [209.85.210.178]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-327e8d3d635sm19731470a91.1.2025.09.04.08.52.27
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 08:52:27 -0700 (PDT)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-77250e45d36so1105408b3a.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Sep 2025 08:52:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWPecskHnty4z+5SKV2Azv4OX8Lqqa3pjk6uwpoSpumQmQZ+p8XUWHcPwcjO/s85jX3/OVWOPmZempCkAGHyw==@lists.sourceforge.net
X-Received: by 2002:a17:903:2c0e:b0:246:92f5:1c07 with SMTP id
 d9443c01a7336-24944b01822mr201057315ad.51.1757001146438; Thu, 04 Sep 2025
 08:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAFF3m8-OTGwzYz26dvBg38xq+v=emLA53Y=qGxcWrsCB6nsVLg@mail.gmail.com>
 <CAFF3m89PtnQ3iKDsfq6ZeS9VNJWt8z=eaJb0tOE+q8BSpyXAsg@mail.gmail.com>
 <CAD=FV=XrYxzX+_3JtE=jCyGHnye=k+tL0zqs+VjiC_ee=FH6Jg@mail.gmail.com>
 <CAFF3m8_+tz=Wm7SvQwrKmP+R6y2oADvCO2GhnfpXfkPwBTnQkQ@mail.gmail.com>
In-Reply-To: <CAFF3m8_+tz=Wm7SvQwrKmP+R6y2oADvCO2GhnfpXfkPwBTnQkQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Sep 2025 08:52:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UCoGVYXDiCwMZvajx2kPXLqNETD3FNaBAkCYVXzxUHFg@mail.gmail.com>
X-Gm-Features: Ac12FXwWro2G3oHn7lmvLyzC7lOX9HG3Cy376y1HuQyt73KdqbyCT4IA38Q8GCw
Message-ID: <CAD=FV=UCoGVYXDiCwMZvajx2kPXLqNETD3FNaBAkCYVXzxUHFg@mail.gmail.com>
To: Sahil Khan <engr.sahil9@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Wed, Sep 3,
 2025 at 6:56 PM Sahil Khan <engr.sahil9@gmail.com>
 wrote: > > Hii Doug, Thanks for the reply. > I am aware about the stop mode
 debugging of kgdb/kdb. I have worked with kgdb/kdb on > 1. [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.166.41 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.41 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uuCgb-0003Eh-8r
Subject: Re: [Kgdb-bugreport] KGDB support over network for Virtual Machine
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-debuggers@vger.kernel.org,
 danielt@kernel.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIFNlcCAzLCAyMDI1IGF0IDY6NTbigK9QTSBTYWhpbCBLaGFuIDxlbmdyLnNh
aGlsOUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGlpIERvdWcsIFRoYW5rcyBmb3IgdGhlIHJlcGx5
Lgo+IEkgYW0gYXdhcmUgYWJvdXQgdGhlIHN0b3AgbW9kZSBkZWJ1Z2dpbmcgb2Yga2dkYi9rZGIu
IEkgaGF2ZSB3b3JrZWQgd2l0aCBrZ2RiL2tkYiBvbgo+IDEuIFFlbXUgaHlwZXJ2aXNvci4KPiAy
LiBWTXdhcmUgZXN4aS92Y2VudHJlLgo+Cj4gTm93LCBJIGtub3cgdGhhdCBvbiBRZW11ICggaWYg
eW91IGhhdmUgYWNjZXNzIHRvIHRoZSBtYWNoaW5lIG9uIHdoaWNoIGl0IGlzIHJ1bm5pbmcpIFZp
cnR1YWwgbWFjaGluZSBzZXJpYWwgcG9ydHMgYXJlIGdlbmVyYWxseSBtYXBwZWQgdG8gc29tZSB0
dHkgZGV2aWNlIG9uIHRoZSBob3N0IG1hY2hpbmUuIERhdGEgY2FuIGJlIHJlbGF5ZWQgYnkgc29j
YXQoaW5nKSB0aGUgdHR5cyBvZiB0aGUgMiB2aXJ0dWFsIG1hY2hpbmVzKCB0YXJnZXQgYW5kIGRl
YnVnZ2VyKS4gQnV0IHRoZSB2bSBzZXJpYWwgcG9ydCB0byB0dHkgbWFwcGluZyBpcyBub3QgcGVy
c2lzdGVudCBvbiByZWJvb3RzLCB0dHkgaXMgcmVhc3NpZ25lZCBtb3N0IG9mIHRoZSB0aW1lLgoK
VGhlIHByb2JsZW0gb2YgdGhlIHR0eSBiZWluZyByZWFzc2lnbmVkIGZlZWxzIGxpa2UgYSB2ZXJ5
IHNvbHZhYmxlIHByb2JsZW0uCgoKPiBOb3cgZm9yIFZNd2FyZSBiYXNlZCB2aXJ0dWFsIG1hY2hp
bmVzLCB3ZSBkbyBub3QgaGF2ZSB0aGUgYWNjZXNzIHRvIHRoZSBtYWNoaW5lIHJ1bm5pbmcgdGhl
IGh5cGVydmlzb3IuIFNvIHRoZSBhYm92ZSBtZXRob2QgZ2VuZXJhbGx5IGRvZXMgbm90IHdvcmsu
IFRoaW5ncyBhcmUgbWFkZSBtb3JlIGRpZmZpY3VsdCB3aGVuIHRoZSBzZXJpYWwgZGV2aWNlIHN1
cHBvcnQgZm9yIHZpcnR1YWwgbWFjaGluZXMgaXMgZGlzYWJsZWQgYnkgdGhlIGh5cGVydmlzb3Iu
CgpGaWd1cmluZyBvdXQgaG93IHRvIGdldCBhY2Nlc3MgdG8gdGhpcyBzZXJpYWwgcG9ydCBhbHNv
IGZlZWxzIGxpa2UgYQpzb2x2YWJsZSBwcm9ibGVtLCBidXQgcGVyaGFwcyB0aGVyZSBhcmUgcG9s
aXRpY3MgaW52b2x2ZWQgc28gd2hvCmtub3dzLi4uCgoKPiBXaGF0IEkgdGhpbmsgc2hvdWxkIGJl
IGNvbnNpZGVyZWQgZm9yIGtnZGIva2RiIGlzIDoKPiAxLiBQcm92aWRlIG5ld29yayBkZWJ1Z2dp
bmcgc3VwcG9ydCBzaW1pbGFyIHRvIHNlcmlhbCBkZXZpY2UgYmFzZWQgZGVidWdnaW5nLgoKSWYg
eW91IGZlZWwgbGlrZSB5b3UgY2FuIHdyaXRlIHBhdGNoZXMgdG8gbWFrZSB0aGlzIHdvcmsgaW4g
YSB3YXkKdGhhdCdzIG5vdCB0b28gaGFja3kgdGhlbiBmZWVsIGZyZWUgdG8gcG9zdCB0aGVtLiBU
aGlzIGZlZWxzIGxpa2UgaXQKd291bGQgYmUgcXVpdGUgZGlmZmljdWx0LCB0aG91Z2ggSSBzdXBw
b3NlIGlmIHlvdSdyZSB0cnlpbmcgdG8KY29uc3RyYWluIHlvdXJzZWxmIHRvIHNvbWUgbmV0d29y
ayBkZXZpY2UgdGhhdCdzIGV4cG9zZWQgYnkgc29tZSBWTQp0aGVuIG1heWJlIGl0J3Mgbm90IGlt
cG9zc2libGUuIEFsbW9zdCBjZXJ0YWlubHkgdGhpcyB3b3VsZCBiZQppbXBvc3NpYmxlIGZvciA5
OSUgb2YgbmV0d29yayBkZXZpY2VzLiBObyB3YXkgYXJlIHlvdSBnb2luZyB0byBnZXQgYW55Cmxh
cmdlIHBlcmNlbnRhZ2Ugb2YgbmV0d29yayBkZXZpY2VzIHRvIHdvcmsgdW5kZXIgYSBzdG9wIG1v
ZGUKZGVidWdnZXIuCgoKPiAyLiBBbGxvdyB1c2VyIHRvIGNob29zZSB0aGUgZnJvbnRlbmQgYi9k
IGtkYiBhbmQga2dkYiwgc2luY2Uga2RiIGlzIHRoZSBkZWZhdWx0IGZyb20gdW5sZXNzIHdlIHdh
bnQgdG8gc3dpdGNoIGJ1dCB0aGF0IHN3aXRjaiByZXF1aXJlcyBrZGIgcHJvbXB0IHJ1bm5pbmcu
CgpJJ20gbm90IHF1aXRlIHN1cmUgd2hhdCB0aGUgYmlnIGRlYWwgaXMgaGVyZS4gSWYgeW91IGp1
c3Qgc3RhcnQgR0RCCndoZW4gdGhlIGtkYiBwcm9tcHQgaXMgdXAgdGhlbiBpdCBhdXRvLXRyYW5z
aXRpb25zIG92ZXIsIGRvZXNuJ3QgaXQ/IEkKc2VlbSB0byByZW1lbWJlciB0aGVyZSBhcmUgYSBi
dW5jaCBvZiBvcHRpb25zIGFyb3VuZCB0aGlzIHRvby4gLi4uYnV0CmlmIHdoYXQncyB0aGVyZSBk
b2Vzbid0IHdvcmsgZm9yIHlvdSB0aGVuIGZlZWwgZnJlZSB0byBzdWJtaXQgYSBwYXRjaC4KSWYg
dGhlIHBhdGNoIGxvb2tzIGdvb2QvdXNlZnVsIHRoZW4gaXQgY2FuIGJlIGxhbmRlZC4KCi1Eb3Vn
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1i
dWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3Jl
cG9ydAo=
