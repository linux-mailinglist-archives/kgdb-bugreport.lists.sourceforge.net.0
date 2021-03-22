Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCFF344C9E
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Mar 2021 18:04:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lONyM-00051g-Ff
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Mar 2021 17:04:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1lONxz-0004wP-5O
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 17:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R5cbTSsJlxps/dQe1Y4urXBDfbL33xhSKZh9rusDAKk=; b=RhR6KZrB7xOeSZENX2vjPYIAcl
 EqnsFTGBdhBYyLhax0HzyuF/sDjoAzo6IBHk5Cn/KipAs12cKl8/y22dVuVR9+0FE1ArG3hNfZVNd
 rNVqHMOMqukD388/uPRzRGTdQPa0O5/m881k1iw7Y5Z2/pLUN2k1fr8lKR4ufynfO9Rg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R5cbTSsJlxps/dQe1Y4urXBDfbL33xhSKZh9rusDAKk=; b=lWaWG0q/C0omWSEaAlsEuEFs9Z
 /YzvAlqCY+O2Mtjb35CPRVgnla3qEhdtRFHHWZjKalXAU1Zb2cGaEknhpzvR60UM+231h3yOzdpBO
 6pbKswIUuLjFf6hWVgzCy5zLMV1VNpjhtTqqh8pkQtZgfNpFJ52x45zv5hjWKUrBL6IA=;
Received: from mail-ed1-f51.google.com ([209.85.208.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lONxq-0002w9-SF
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 17:03:46 +0000
Received: by mail-ed1-f51.google.com with SMTP id b16so20263885eds.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Mar 2021 10:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=R5cbTSsJlxps/dQe1Y4urXBDfbL33xhSKZh9rusDAKk=;
 b=ROJomO9lUPupat7Qd4lgEtJk8l0XOwcJXoArp1PjhTUKLEsFIAfYC5pTjSOccFSsB5
 T5W5RMKl7EJ17sEmQRIT7m+3yK9A3sMqValC0LidXCpsXCb6pOZoga61GBV952ylUxSV
 HIUB4j7/qaPLMUyRpo+R5KbRwHmtu2kNTCcsorP3bK+vpNQRYckQC2GXJVzfobRnhNXU
 FIpdUkfIH54f1+hWeHsniFpFIy7B4J6mdEAY7YvKC1PG9MrgpJVYQZTwLBu8ZHR+GB9f
 G66+NdVrvX/X7oThfFf5s49TjBV38cL6quUE+x3lv6fhhy9B9NaDQewW9AG5hDzodcPp
 8kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=R5cbTSsJlxps/dQe1Y4urXBDfbL33xhSKZh9rusDAKk=;
 b=TVYsAX/BQmp3YIRG+iUk/bs4D8wxCdU+otiWZARiqgPvChRDvJh4S4BW+cwLlk2QZD
 wIHmIxmzUJqn410swl2EH3t/Q4SHrM+wuE/mk3zXythgQsSxX/o1fRAg6MiirNN/4HrP
 I5u3QA+cv9GzUf0/98UMdl295XS5n6w1KWRv6GjvbxsUb3BKnrHsPsbbJhINs1deSM6O
 O+1QOmeqmqtYETd5J3yMp9sDC3usFJS383QvoSzbWUnCCkCaPry1gSuWPUGg/Fe+e4Lu
 TBXXYfYSmhrrbiFELoIVnCXJAiJX64nQe2A60ejHHZ1QbPhUkB4vcWh6NxIdTvbnVjvp
 QYlg==
X-Gm-Message-State: AOAM53011jPF4zdge16SgqRpwWtOXXe9btcvRgaeOYkNMn6w8T2IN2Lf
 3zQ54+MhaursZeNGU+1E4aRVsg==
X-Google-Smtp-Source: ABdhPJxRy+uZT0LE9fyXddnHba4vvzr2UB6Q7r8FqUZixusDFnBaCfGOeaHFYLOF/emFKw367dhuXQ==
X-Received: by 2002:a50:fe81:: with SMTP id d1mr604857edt.308.1616432612493;
 Mon, 22 Mar 2021 10:03:32 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id c15sm9864438ejm.52.2021.03.22.10.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 10:03:31 -0700 (PDT)
Date: Mon, 22 Mar 2021 17:03:30 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <20210322170330.wil52d2geopfnfka@maple.lan>
References: <20210322164308.827846-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322164308.827846-1-arnd@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.51 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lONxq-0002w9-SF
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: fix gcc-11 warning on indentation
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Ingo Molnar <mingo@elte.hu>,
 Christian Brauner <christian.brauner@ubuntu.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gTW9uLCBNYXIgMjIsIDIwMjEgYXQgMDU6NDM6MDNQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IGdjYy0xMSBz
dGFydHMgd2FybmluZyBhYm91dCBtaXNsZWFkaW5nIGluZGVudGF0aW9uIGluc2lkZSBvZiBtYWNy
b3M6Cj4gCj4gZHJpdmVycy9taXNjL2tnZGJ0cy5jOiBJbiBmdW5jdGlvbiDigJhrZ2RidHNfYnJl
YWtfdGVzdOKAmToKPiBkcml2ZXJzL21pc2Mva2dkYnRzLmM6MTAzOjk6IGVycm9yOiB0aGlzIOKA
mGlm4oCZIGNsYXVzZSBkb2VzIG5vdCBndWFyZC4uLiBbLVdlcnJvcj1taXNsZWFkaW5nLWluZGVu
dGF0aW9uXQo+ICAgMTAzIHwgICAgICAgICBpZiAodmVyYm9zZSA+IDEpIFwKPiAgICAgICB8ICAg
ICAgICAgXn4KPiBkcml2ZXJzL21pc2Mva2dkYnRzLmM6MjAwOjk6IG5vdGU6IGluIGV4cGFuc2lv
biBvZiBtYWNybyDigJh2MnByaW50a+KAmQo+ICAgMjAwIHwgICAgICAgICB2MnByaW50aygia2dk
YnRzOiBicmVha3BvaW50IGNvbXBsZXRlXG4iKTsKPiAgICAgICB8ICAgICAgICAgXn5+fn5+fn4K
PiBkcml2ZXJzL21pc2Mva2dkYnRzLmM6MTA1OjE3OiBub3RlOiAuLi50aGlzIHN0YXRlbWVudCwg
YnV0IHRoZSBsYXR0ZXIgaXMgbWlzbGVhZGluZ2x5IGluZGVudGVkIGFzIGlmIGl0IHdlcmUgZ3Vh
cmRlZCBieSB0aGUg4oCYaWbigJkKPiAgIDEwNSB8ICAgICAgICAgICAgICAgICB0b3VjaF9ubWlf
d2F0Y2hkb2coKTsgICBcCj4gICAgICAgfCAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fn5+Cj4gCj4gVGhlIGNvZGUgbG9va3MgY29ycmVjdCB0byBtZSwgc28ganVzdCByZWluZGVudCBp
dCBmb3IgcmVhZGFiaWxpdHkuCj4gCj4gRml4ZXM6IGU4ZDMxYzIwNGUzNiAoImtnZGI6IGFkZCBr
Z2RiIGludGVybmFsIHRlc3Qgc3VpdGUiKQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+CgpBY2tlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBz
b25AbGluYXJvLm9yZz4KCldoaWNoIHRyZWUgZG8geW91IHdhbnQgdG8gbWVyZ2UgdGhpcyBvbmUg
dGhvdWdoPyBJJ3ZlIGdvdCBub3RoaW5nIGVsc2UKcGVuZGluZyBmb3IgdGhpcyBmaWxlIHNvIEkg
YW0gdmVyeSByZWxheGVkIGFib3V0IHRoZSByb3V0ZS4uLgoKCkRhbmllbC4KCgo+IC0tLQo+ICBk
cml2ZXJzL21pc2Mva2dkYnRzLmMgfCAyNiArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9rZ2RidHMuYyBiL2RyaXZlcnMvbWlzYy9rZ2RidHMuYwo+
IGluZGV4IDk0NTcwMWJjZTU1My4uMmUwODFhNThkYTZjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bWlzYy9rZ2RidHMuYwo+ICsrKyBiL2RyaXZlcnMvbWlzYy9rZ2RidHMuYwo+IEBAIC05NSwxOSAr
OTUsMTkgQEAKPiAgCj4gICNpbmNsdWRlIDxhc20vc2VjdGlvbnMuaD4KPiAgCj4gLSNkZWZpbmUg
djFwcmludGsoYS4uLikgZG8geyBcCj4gLQlpZiAodmVyYm9zZSkgXAo+IC0JCXByaW50ayhLRVJO
X0lORk8gYSk7IFwKPiAtCX0gd2hpbGUgKDApCj4gLSNkZWZpbmUgdjJwcmludGsoYS4uLikgZG8g
eyBcCj4gLQlpZiAodmVyYm9zZSA+IDEpIFwKPiAtCQlwcmludGsoS0VSTl9JTkZPIGEpOyBcCj4g
LQkJdG91Y2hfbm1pX3dhdGNoZG9nKCk7CVwKPiAtCX0gd2hpbGUgKDApCj4gLSNkZWZpbmUgZXBy
aW50ayhhLi4uKSBkbyB7IFwKPiAtCQlwcmludGsoS0VSTl9FUlIgYSk7IFwKPiAtCQlXQVJOX09O
KDEpOyBcCj4gLQl9IHdoaWxlICgwKQo+ICsjZGVmaW5lIHYxcHJpbnRrKGEuLi4pIGRvIHsJCVwK
PiArCWlmICh2ZXJib3NlKQkJCVwKPiArCQlwcmludGsoS0VSTl9JTkZPIGEpOwlcCj4gK30gd2hp
bGUgKDApCj4gKyNkZWZpbmUgdjJwcmludGsoYS4uLikgZG8gewkJXAo+ICsJaWYgKHZlcmJvc2Ug
PiAxKQkJXAo+ICsJCXByaW50ayhLRVJOX0lORk8gYSk7CVwKPiArCXRvdWNoX25taV93YXRjaGRv
ZygpOwkJXAo+ICt9IHdoaWxlICgwKQo+ICsjZGVmaW5lIGVwcmludGsoYS4uLikgZG8gewkJXAo+
ICsJcHJpbnRrKEtFUk5fRVJSIGEpOwkJXAo+ICsJV0FSTl9PTigxKTsJCQlcCj4gK30gd2hpbGUg
KDApCj4gICNkZWZpbmUgTUFYX0NPTkZJR19MRU4JCTQwCj4gIAo+ICBzdGF0aWMgc3RydWN0IGtn
ZGJfaW8ga2dkYnRzX2lvX29wczsKPiAtLSAKPiAyLjI5LjIKPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxp
c3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
