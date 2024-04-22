Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A493E8AD732
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Apr 2024 00:20:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rz21W-0001nt-5J
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 22 Apr 2024 22:20:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1rz21T-0001nm-VI
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 22:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b4TkjiOmnf7EkU2uUP7WyZ/U9eWwbiO9i0mpJYmLC7M=; b=celu+beDqkfGaSlY1R/NbLpYNF
 92d2WKGbC4ZTUToRtOH2CApjl0N3QyTQfS0X+a0qyNl35Q73K7qZ21DDYzQzGw5kabgwzfzlu9m1t
 OcXnzbQktz0VbN68ntUYuHTu8j1IRGi+vaNcsAUSOmkVPWOpck+xcRZmJZFC+JFQJteA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b4TkjiOmnf7EkU2uUP7WyZ/U9eWwbiO9i0mpJYmLC7M=; b=ibjcGTFj1adiqtBW6UQRe7CKWi
 0cNqQVZEnIyy6tIKbk/lIovAlrx40GbfNU2JU+Hq1bEbnY4lH2QUkqMx9oVz6viZZS2trmCw0AyeQ
 h2yBoOlvaxfNTYKy2l4UKVUfMUud/1D7LMkTuHL0iYN02EmG+0Xd3q1qwfSq2eOGxtJU=;
Received: from mail-oa1-f48.google.com ([209.85.160.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rz21S-0006N5-RY for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 22:20:28 +0000
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-2228c4c5ac3so2864547fac.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 15:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713824416; x=1714429216;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b4TkjiOmnf7EkU2uUP7WyZ/U9eWwbiO9i0mpJYmLC7M=;
 b=QULjxj4P8po07N/pKK9wdC5L04MOn4B5/t3gEeKAb0PUzmb/0UDQO06VrOr7tOJw92
 KS9r8Keoxmz8PVZsl6mWeLebjtG/zvSm1rrXFfGNlq5Vw82RUxXNjjcFuOQ2jYdPIrDE
 vv9GuHvAo+rT8twln3wvy5w/Fgs8TAlv9RcQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713824416; x=1714429216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b4TkjiOmnf7EkU2uUP7WyZ/U9eWwbiO9i0mpJYmLC7M=;
 b=DEPL6x2I4cB71XxqDuEzhb96iA/TPLRSSQ7mZc7jJOKvQB6Vc7w0mVVc+LuDRgrZhK
 +6cCNkC0M5ZKz0gxEClq9pJLxJkVQ0l/wGxH7Z3Q1Emw30hqoT+AkrJbKqAZI2TPxa4Y
 zUM4IZD/pK1K7rqubBXMc71ryZIuXqzLt1pCPmfiik5mXaKcJzOhxMknkLZFGZKRAYvS
 43BvkLdPA0h7kQRGXmyL3+ZPfi/cbZzczckI8nZDBMTX5YCC3Ggq6YCZZOmQ25Of8Gh+
 NePJ4gYJ/CtqGViGew3Aejxp0eE5dDId+jC/Drleoz/ESuHTk7e4WxFSPISgKyushqhO
 noow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZenIf06M77WdUw1VttfwFwbzRzVBDEP2wtk8P+Rk+eAeC/H0TNu0hA93HDXioiID7Tj+sdiVbOBJjjWaJIv/Em7HlXxKAWYbe1NgHXEN8OrqDNx8=
X-Gm-Message-State: AOJu0Yx/3rs3gXe50uLi+6wz6gIMGeOej8mqC10F2vf3h0PZmKOLANPN
 GcOqQ46DjgHuoNZNecP+ivtBcvIn0q527RUxZ6TEai4TtHqX7CfvLBFTcO0ASV/zBohviPBZm0p
 3vwbM
X-Google-Smtp-Source: AGHT+IHdLZfrzSoet3W2/U2JqGsh8oSfLPJaqH92nUAQqDkdFwWBtDoRL0wZL/fK98bsQSBWH7eK6A==
X-Received: by 2002:a05:6214:923:b0:6a0:8778:b40b with SMTP id
 dk3-20020a056214092300b006a08778b40bmr1927581qvb.18.1713822866322; 
 Mon, 22 Apr 2024 14:54:26 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 w2-20020a0cb542000000b0069b55bf11a2sm4658690qvd.139.2024.04.22.14.54.24
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 14:54:25 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-434ffc2b520so61921cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 14:54:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUeRjpeayvqoOWqZ5Tn/mHC5GvxHHfY/JQ/hloqa7jPBGa8a7Y/8aSglUH5K+6SYAEhJ7ae0ep8EbJPLc8w17ssOyR8bLPft1cfTBgC2wCTG3JkBCQ=
X-Received: by 2002:ac8:550d:0:b0:439:9aa4:41ed with SMTP id
 j13-20020ac8550d000000b004399aa441edmr95963qtq.16.1713822864486; Mon, 22 Apr
 2024 14:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240419-kgdboc_fix_schedule_work-v1-1-ff19881677e5@linaro.org>
In-Reply-To: <20240419-kgdboc_fix_schedule_work-v1-1-ff19881677e5@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Apr 2024 14:54:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UHt7Pm-qEBs7vtK0B0DCbu9YbU465OdpSKCYZVpNuOaA@mail.gmail.com>
Message-ID: <CAD=FV=UHt7Pm-qEBs7vtK0B0DCbu9YbU465OdpSKCYZVpNuOaA@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Fri, Apr 19, 2024 at 3:30 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > Currently, when kdb is compiled with keyboard support, then we
    will use > schedule_work() to provoke reset of [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.160.48 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rz21S-0006N5-RY
Subject: Re: [Kgdb-bugreport] [PATCH] serial: kgdboc: Fix NMI-safety
 problems from keyboard reset code
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
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Liuye <liu.yeC@h3c.com>, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBGcmksIEFwciAxOSwgMjAyNCBhdCAzOjMw4oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIHdoZW4ga2Ri
IGlzIGNvbXBpbGVkIHdpdGgga2V5Ym9hcmQgc3VwcG9ydCwgdGhlbiB3ZSB3aWxsIHVzZQo+IHNj
aGVkdWxlX3dvcmsoKSB0byBwcm92b2tlIHJlc2V0IG9mIHRoZSBrZXlib2FyZCBzdGF0dXMuICBV
bmZvcnR1bmF0ZWx5Cj4gc2NoZWR1bGVfd29yaygpIGdldHMgY2FsbGVkIGZyb20gdGhlIGtnZGJv
YyBwb3N0LWRlYnVnLWV4Y2VwdGlvbgo+IGhhbmRsZXIuICBUaGF0IHJpc2tzIGRlYWRsb2NrIHNp
bmNlIHNjaGVkdWxlX3dvcmsoKSBpcyBub3QgTk1JLXNhZmUgYW5kLAo+IGV2ZW4gb24gcGxhdGZv
cm1zIHdoZXJlIHRoZSBOTUkgaXMgbm90IGRpcmVjdGx5IHVzZWQgZm9yIGRlYnVnZ2luZywgdGhl
Cj4gZGVidWcgdHJhcCBjYW4gaGF2ZSBOTUktbGlrZSBiZWhhdmlvdXIgZGVwZW5kaW5nIG9uIHdo
ZXJlIGJyZWFrcG9pbnRzCj4gYXJlIHBsYWNlZC4KPgo+IEZpeCB0aGlzIGJ5IHVzaW5nIHRoZSBp
cnEgd29yayBzeXN0ZW0sIHdoaWNoIGlzIE5NSS1zYWZlLCB0byBkZWZlciB0aGUKPiBjYWxsIHRv
IHNjaGVkdWxlX3dvcmsoKSB0byBhIHBvaW50IHdoZW4gaXQgaXMgc2FmZSB0byBjYWxsLgo+Cj4g
UmVwb3J0ZWQtYnk6IExpdXllIDxsaXUueWVDQGgzYy5jb20+Cj4gQ2xvc2VzOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNDAyMjgwMjU2MDIuMzA4Nzc0OC0xLWxpdS55ZUNAaDNjLmNv
bS8KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBU
aG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvdHR5
L3NlcmlhbC9rZ2Rib2MuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9rZ2Rib2MuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9r
Z2Rib2MuYwo+IGluZGV4IDdjZTdiYjE2NDAwNTQuLmFkY2VhNzBmZDc1MDcgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy90dHkvc2VyaWFsL2tnZGJvYy5jCj4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFs
L2tnZGJvYy5jCj4gQEAgLTE5LDYgKzE5LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2NvbnNvbGUu
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L3Z0X2tlcm4uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2lucHV0
Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pcnFfd29yay5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9k
dWxlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L3NlcmlhbF9jb3JlLmg+Cj4gQEAgLTQ4LDYgKzQ5LDI1IEBAIHN0YXRpYyBzdHJ1Y3Qg
a2dkYl9pbyAgICAgICAgICAgICAgICBrZ2Rib2NfZWFybHljb25faW9fb3BzOwo+ICBzdGF0aWMg
aW50ICAgICAgICAgICAgICAgICAgICAgICgqZWFybHljb25fb3JpZ19leGl0KShzdHJ1Y3QgY29u
c29sZSAqY29uKTsKPiAgI2VuZGlmIC8qIElTX0JVSUxUSU4oQ09ORklHX0tHREJfU0VSSUFMX0NP
TlNPTEUpICovCj4KPiArLyoKPiArICogV2hlbiB3ZSBsZWF2ZSB0aGUgZGVidWcgdHJhcCBoYW5k
bGVyIHdlIG5lZWQgdG8gcmVzZXQgdGhlIGtleWJvYXJkIHN0YXR1cwo+ICsgKiAoc2luY2UgdGhl
IG9yaWdpbmFsIGtleWJvYXJkIHN0YXRlIGdldHMgcGFydGlhbGx5IGNsb2JiZXJlZCBieSBrZGIg
dXNlIG9mCj4gKyAqIHRoZSBrZXlib2FyZCkuCj4gKyAqCj4gKyAqIFRoZSBwYXRoIHRvIGRlbGl2
ZXIgdGhlIHJlc2V0IGlzIHNvbWV3aGF0IGNpcmN1aXRvdXMuCj4gKyAqCj4gKyAqIFRvIGRlbGl2
ZXIgdGhlIHJlc2V0IHdlIHJlZ2lzdGVyIGFuIGlucHV0IGhhbmRsZXIsIHJlc2V0IHRoZSBrZXli
b2FyZCBhbmQKPiArICogdGhlbiBkZXJlZ2lzdGVyIHRoZSBpbnB1dCBoYW5kbGVyLiBIb3dldmVy
LCB0byBnZXQgdGhpcyBkb25lIHJpZ2h0LCB3ZSBkbwo+ICsgKiBoYXZlIHRvIGNhcmVmdWxseSBt
YW5hZ2UgdGhlIGNhbGxpbmcgY29udGV4dCBiZWNhdXNlIHdlIGNhbiBvbmx5IHJlZ2lzdGVyCj4g
KyAqIGlucHV0IGhhbmRsZXJzIGZyb20gdGFzayBjb250ZXh0Lgo+ICsgKgo+ICsgKiBJbiBwYXJ0
aWN1bGFyIHdlIG5lZWQgdG8gdHJpZ2dlciB0aGUgYWN0aW9uIGZyb20gdGhlIGRlYnVnIHRyYXAg
aGFuZGxlciB3aXRoCj4gKyAqIGFsbCBpdHMgTk1JIGFuZC9vciBOTUktbGlrZSBvZGRpdGllcy4g
VG8gc29sdmUgdGhpcyB0aGUga2dkYm9jIHRyYXAgZXhpdCBjb2RlCj4gKyAqICh0aGUgInBvc3Rf
ZXhjZXB0aW9uIiBjYWxsYmFjaykgdXNlcyBpcnFfd29ya19xdWV1ZSgpLCB3aGljaCBpcyBOTUkt
c2FmZSwgdG8KPiArICogc2NoZWR1bGUgYSBjYWxsYmFjayBmcm9tIGEgaGFyZGlycSBjb250ZXh0
LiBGcm9tIHRoZXJlIHdlIGhhdmUgdG8gZGVmZXIgdGhlCj4gKyAqIHdvcmsgYWdhaW4sIHRoaXMg
dGltZSB1c2luZyBzY2hlZHVsZV9Xb3JrKCksIHRvIGdldCBhIGNhbGxiYWNrIHVzaW5nIHRoZQoK
bml0OiBzY2hlZHVsZV93b3JrKCkgKG5vIGNhcGl0YWwgIlciKS4KCj4gKyAqIHN5c3RlbSB3b3Jr
cXVldWUsIHdoaWNoIHJ1bnMgaW4gdGFzayBjb250ZXh0LgoKVGhhbmsgeW91IGZvciB0aGUgY29t
bWVudC4gSXQgbWFrZXMgdGhlIGRvdWJsZS1qdW1wIHRocm91Z2ggSVJRIHdvcmsKYW5kIHRoZW4g
bm9ybWFsIHdvcmsgY2xlYXJlci4KCgpPdGhlciB0aGFuIHRoZSBuaXQgaW4gdGhlIGNvbW1lbnQs
IHRoaXMgbG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxk
aWFuZGVyc0BjaHJvbWl1bS5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
